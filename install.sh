#!/usr/bin/env bash

# NixOS installer
# Provides local variables, hardware config, optional GitHub SSH setup, and rebuild.

set -euo pipefail

trap 'fail "Installer failed near line ${LINENO}. Check the output above and fix the issue before rerunning."' ERR

HOST="${HOST:-nixos}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST_DIR="${REPO_DIR}/hosts/${HOST}"
LOCAL_VARS="${HOST_DIR}/variables.local.nix"
HARDWARE="${HOST_DIR}/hardware.nix"

info() {
  printf '\n[INFO] %s\n' "$1"
}

warn() {
  printf '\n[WARN] %s\n' "$1"
}

fail() {
  printf '\n[ERROR] %s\n' "$1" >&2
  exit 1
}

ask_yes_no() {
  local prompt="$1"
  local default="${2:-y}"
  local answer

  while true; do
    if [[ "${default}" == "y" ]]; then
      read -r -p "${prompt} [Y/n]: " answer
      answer="${answer:-Y}"
    else
      read -r -p "${prompt} [y/N]: " answer
      answer="${answer:-N}"
    fi

    case "${answer,,}" in
      y|yes) return 0 ;;
      n|no) return 1 ;;
      *) echo "Please answer yes or no." ;;
    esac
  done
}

ask_optional() {
  local prompt="$1"
  local value

  read -r -p "${prompt} (optional, press Enter to skip): " value
  printf '%s\n' "${value}"
}

ask_username() {
  local value

  while true; do
    read -r -p "Enter new username: " value

    if [[ -z "${value}" ]]; then
      echo "Username is required when creating a new user."
      continue
    fi

    if [[ ! "${value}" =~ ^[a-z_][a-z0-9_-]*$ ]]; then
      echo "Invalid username. Use lowercase letters, numbers, underscore, or dash; first char must be a letter or underscore."
      continue
    fi

    printf '%s\n' "${value}"
    return 0
  done
}

ask_password() {
  local password
  local password_confirm

  while true; do
    read -r -s -p "Enter new password: " password
    echo
    read -r -s -p "Confirm new password: " password_confirm
    echo

    if [[ -z "${password}" ]]; then
      echo "Password cannot be empty."
      continue
    fi

    if [[ "${password}" != "${password_confirm}" ]]; then
      echo "Passwords do not match."
      continue
    fi

    printf '%s\n' "${password}"
    return 0
  done
}

backup_file() {
  local file="$1"

  if [[ -f "${file}" ]]; then
    local backup="${file}.bak.$(date +%Y%m%d-%H%M%S)"
    cp -a "${file}" "${backup}"
    echo "Backup created: ${backup}"
  fi
}

nix_string_or_null() {
  local value="${1:-}"

  if [[ -z "${value}" ]]; then
    printf 'null'
    return 0
  fi

  value="${value//\\/\\\\}"
  value="${value//\"/\\\"}"
  value="${value//$'\n'/ }"
  printf '"%s"' "${value}"
}

require_command() {
  local command_name="$1"
  local message="$2"

  if ! command -v "${command_name}" >/dev/null 2>&1; then
    fail "${message}"
  fi
}

hash_password() {
  local password="$1"

  if command -v mkpasswd >/dev/null 2>&1; then
    mkpasswd -m sha-512 "${password}"
  elif command -v openssl >/dev/null 2>&1; then
    openssl passwd -6 "${password}"
  else
    fail "No password hashing tool found. Install mkpasswd or openssl."
  fi
}

valid_email_like() {
  local value="$1"

  [[ "${value}" =~ ^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$ ]]
}

github_auth_confirmed() {
  command -v gh >/dev/null 2>&1 && gh auth status --hostname github.com >/dev/null 2>&1
}

validate_repo_layout() {
  if [[ ! -f "${REPO_DIR}/flake.nix" ]]; then
    fail "flake.nix not found in ${REPO_DIR}. Run this installer from the NixOS config repository root."
  fi

  if [[ ! -d "${REPO_DIR}/hosts" ]]; then
    fail "hosts/ directory not found in ${REPO_DIR}. Run this installer from the NixOS config repository root."
  fi
}

validate_host_dir() {
  if [[ -d "${HOST_DIR}" ]]; then
    return 0
  fi

  warn "Host directory does not exist: ${HOST_DIR}"
  warn "This usually means HOST is wrong or this host is not defined in flake.nix."

  if ask_yes_no "Create ${HOST_DIR} anyway?" "n"; then
    mkdir -p "${HOST_DIR}"
  else
    fail "Aborted. Use HOST=nixos ./install.sh or create the host directory first."
  fi
}

switch_github_remote_to_ssh() {
  if ! command -v git >/dev/null 2>&1; then
    warn "git is not installed. Skipping remote switch."
    return 0
  fi

  if [[ ! -d "${REPO_DIR}/.git" ]]; then
    warn "Git repo not found at ${REPO_DIR}. Skipping remote switch."
    return 0
  fi

  if [[ ! -f "${HOME}/.ssh/id_ed25519.pub" ]]; then
    warn "SSH public key not found. Skipping remote switch."
    return 0
  fi

  local current_remote
  current_remote="$(git -C "${REPO_DIR}" remote get-url origin 2>/dev/null || true)"

  if [[ -z "${current_remote}" ]]; then
    warn "Git origin remote is missing. Skipping remote switch."
    return 0
  fi

  if [[ "${current_remote}" =~ ^https://github\.com/([^/]+)/(.+)\.git$ ]]; then
    local owner="${BASH_REMATCH[1]}"
    local repo="${BASH_REMATCH[2]}"
    local ssh_remote="git@github.com:${owner}/${repo}.git"

    git -C "${REPO_DIR}" remote set-url origin "${ssh_remote}"
    echo "Git remote switched to SSH: ${ssh_remote}"
    return 0
  fi

  if [[ "${current_remote}" =~ ^git@github\.com:.+/.+\.git$ ]]; then
    echo "Git remote is already SSH: ${current_remote}"
    return 0
  fi

  warn "Git origin is not a GitHub HTTPS remote. Current origin: ${current_remote}. Skipping remote switch."
}

run_flake_check() {
  if ! command -v nix >/dev/null 2>&1; then
    warn "nix command not found. Skipping flake check."
    return 0
  fi

  info "Running nix flake check."
  if nix flake check "path:${REPO_DIR}" --no-write-lock-file; then
    echo "Flake check passed."
    return 0
  fi

  warn "nix flake check failed."
  if ask_yes_no "Continue to nixos-rebuild anyway?" "n"; then
    return 0
  fi

  fail "Aborted because flake check failed."
}

print_plan() {
  cat <<EOF_PLAN
Install plan:
1) Validate repository and host
2) Collect local user and optional git info
3) Generate ${LOCAL_VARS}
4) Generate ${HARDWARE}
5) Optionally generate SSH key and authenticate GitHub
6) Optionally switch GitHub origin remote from HTTPS to SSH
7) Run flake check
8) Optionally run nixos-rebuild switch for flake: ${REPO_DIR}#${HOST}
EOF_PLAN
}

print_summary() {
  cat <<EOF_SUMMARY

Summary:
  Host:             ${HOST}
  Repository:       ${REPO_DIR}
  Create new user:  ${enable_new_user}
  Username:         ${username}
  Git username:     ${git_username:-<skipped>}
  Git email:        ${git_email:-<skipped>}
  variables file:   ${LOCAL_VARS}
  hardware file:    ${HARDWARE}
EOF_SUMMARY
}

print_plan

validate_repo_layout
validate_host_dir

require_command nixos-generate-config "nixos-generate-config not found. Run this installer on NixOS."
require_command nixos-rebuild "nixos-rebuild not found. Run this installer on NixOS."

if [[ "$(id -u)" -eq 0 ]]; then
  warn "Running this installer as root is not recommended. HOME is currently ${HOME}."
  if ! ask_yes_no "Continue as root?" "n"; then
    fail "Aborted. Run the installer as your normal user."
  fi
fi

if ask_yes_no "Create new user?" "y"; then
  username="$(ask_username)"
  password="$(ask_password)"
  enable_new_user="true"
else
  username="$(whoami)"
  password=""
  enable_new_user="false"

  if [[ "${username}" == "nixos" ]]; then
    warn "Current user is 'nixos' from the live ISO. A real user is required for this config."
    username="$(ask_username)"
    password="$(ask_password)"
    enable_new_user="true"
  fi
fi

git_username="$(ask_optional "Enter git username")"
git_email="$(ask_optional "Enter git email")"

if [[ -n "${git_email}" ]] && ! valid_email_like "${git_email}"; then
  warn "Git email does not look like a valid email address: ${git_email}"
  if ! ask_yes_no "Keep this git email anyway?" "n"; then
    git_email=""
  fi
fi

if [[ -z "${git_username}" || -z "${git_email}" ]]; then
  warn "Git identity is incomplete. Git username/email will be written as null where skipped. You can configure it later."
fi

generate_ssh="false"
gh_auth="false"
switch_remote="false"

if ask_yes_no "Generate SSH key for GitHub?" "n"; then
  generate_ssh="true"
fi

if ask_yes_no "Authenticate GitHub via gh?" "n"; then
  gh_auth="true"
fi

if ask_yes_no "Switch GitHub origin remote from HTTPS to SSH?" "n"; then
  switch_remote="true"
fi

hashed_password=""
if [[ "${enable_new_user}" == "true" ]]; then
  info "Hashing password."
  hashed_password="$(hash_password "${password}")"
  unset password
fi

if [[ "${generate_ssh}" == "true" ]]; then
  if ! command -v ssh-keygen >/dev/null 2>&1; then
    warn "ssh-keygen not found. Skipping SSH key generation."
  else
    ssh_dir="${HOME}/.ssh"
    key_path="${ssh_dir}/id_ed25519"
    ssh_comment="${git_email:-${username}@$(hostname)}"

    if [[ -f "${key_path}" ]]; then
      if ask_yes_no "${key_path} already exists. Overwrite it?" "n"; then
        backup_file "${key_path}"
        backup_file "${key_path}.pub"
        rm -f "${key_path}" "${key_path}.pub"
      else
        warn "Keeping existing SSH key."
        generate_ssh="false"
      fi
    fi

    if [[ "${generate_ssh}" == "true" ]]; then
      mkdir -p "${ssh_dir}"
      chmod 700 "${ssh_dir}"
      ssh-keygen -t ed25519 -C "${ssh_comment}" -f "${key_path}" -N ""
      echo "SSH public key:"
      cat "${key_path}.pub"
    fi
  fi
fi

if [[ "${gh_auth}" == "true" ]]; then
  if ! command -v gh >/dev/null 2>&1; then
    warn "gh CLI not found. Skipping GitHub auth."
    gh_auth="false"
  else
    if gh auth login --hostname github.com; then
      echo "GitHub authentication complete."
    else
      warn "GitHub authentication failed or was cancelled. Continuing without GitHub auth."
      gh_auth="false"
    fi

    if [[ "${gh_auth}" == "true" && -f "${HOME}/.ssh/id_ed25519.pub" ]]; then
      key_title="${git_username:-${username}}@$(hostname)"
      if gh ssh-key add "${HOME}/.ssh/id_ed25519.pub" -t "${key_title}"; then
        echo "SSH key added to GitHub as: ${key_title}"
      else
        warn "Could not add SSH key to GitHub. It may already exist. Continuing."
      fi
    elif [[ "${gh_auth}" == "true" ]]; then
      warn "No SSH public key found. Skipping GitHub key upload."
    fi
  fi
fi

if [[ "${switch_remote}" == "true" ]]; then
  if github_auth_confirmed; then
    switch_github_remote_to_ssh
  else
    warn "GitHub auth is not confirmed. Switching origin to SSH may break git pull/push until SSH access works."
    if ask_yes_no "Switch remote anyway?" "n"; then
      switch_github_remote_to_ssh
    else
      warn "Keeping current Git remote."
    fi
  fi
fi

print_summary

if ! ask_yes_no "Write local config files now?" "y"; then
  fail "Aborted before writing local config files."
fi

backup_file "${LOCAL_VARS}"
cat > "${LOCAL_VARS}" <<EOF_VARS
{
  enableNewUser = ${enable_new_user};

  username = $(nix_string_or_null "${username}");
  hashedPassword = $(nix_string_or_null "${hashed_password}");

  gitUsername = $(nix_string_or_null "${git_username}");
  gitEmail = $(nix_string_or_null "${git_email}");
}
EOF_VARS
echo "Generated ${LOCAL_VARS}"

if [[ -f "${HARDWARE}" ]]; then
  if ask_yes_no "${HARDWARE} already exists. Regenerate it?" "n"; then
    backup_file "${HARDWARE}"
    nixos-generate-config --show-hardware-config > "${HARDWARE}"
    echo "Generated ${HARDWARE}"
  else
    echo "Keeping existing ${HARDWARE}"
  fi
else
  nixos-generate-config --show-hardware-config > "${HARDWARE}"
  echo "Generated ${HARDWARE}"
fi

run_flake_check

if ask_yes_no "Run nixos-rebuild switch now?" "y"; then
  if sudo nixos-rebuild switch --flake "path:${REPO_DIR}#${HOST}" --no-write-lock-file; then
    echo "Switch complete."
  else
    fail "nixos-rebuild failed. Check the error above, fix the config, and rerun the installer."
  fi
else
  echo "Skipped rebuild. Run manually: sudo nixos-rebuild switch --flake 'path:${REPO_DIR}#${HOST}' --no-write-lock-file"
  exit 0
fi

if command -v systemctl >/dev/null 2>&1 && [[ -d /run/systemd/system ]]; then
  if ask_yes_no "Reboot now?" "n"; then
    sudo systemctl reboot
  else
    echo "Switch complete. Reboot manually when ready."
  fi
else
  echo "Switch complete. Reboot manually when ready."
fi
