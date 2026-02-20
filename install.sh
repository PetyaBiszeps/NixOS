#!/usr/bin/env bash

# strict mode
set -euo pipefail

# dirs
HOST="${HOSTNAME:-nixos}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_VARS="${REPO_DIR}/hosts/${HOST}/variables.local.nix"
HARDWARE="${REPO_DIR}/hosts/${HOST}/hardware.nix"

echo "Install plan:"
echo "1) Collect user and git info"
echo "2) Generate ${LOCAL_VARS}"
echo "3) Generate ${HARDWARE}"
echo "4) nixos-rebuild switch (flake: ${REPO_DIR}#${HOST})"

# nixos-generate-config exists check
if ! command -v nixos-generate-config >/dev/null 2>&1; then
  echo "nixos-generate-config not found. Run this on NixOS."
  exit 1
fi

# user validation
read -r -p "Create new user? [Y/n]: " create_user
create_user="${create_user:-Y}"

if [[ "${create_user,,}" == "n" || "${create_user,,}" == "no" ]]; then
  username="$(whoami)"
  password=""
  enable_new_user="false"
  if [[ "${username}" == "nixos" ]]; then
    echo "Current user is 'nixos' (live ISO). You must create a new user."
    exit 1
  fi
else
  read -r -p "Enter new username: " username
  read -r -s -p "Enter new password: " password
  echo
  enable_new_user="true"
fi

# git validation
read -r -p "Enter git username: " git_username
read -r -p "Enter git email: " git_email

# validation check
if [[ -z "${username}" || -z "${git_username}" || -z "${git_email}" ]]; then
  echo "All fields are required. Aborting."
  exit 1
fi

# Hashing
hashed_password=""
if [[ "${enable_new_user}" == "true" ]]; then
  if command -v mkpasswd >/dev/null 2>&1; then
    hashed_password="$(mkpasswd -m sha-512 "${password}")"
  elif command -v openssl >/dev/null 2>&1; then
    hashed_password="$(openssl passwd -6 "${password}")"
  else
    echo "No password hashing tool found (mkpasswd/openssl). Aborting."
    exit 1
  fi
fi

# Ensure host directory exists
mkdir -p "$(dirname "${LOCAL_VARS}")"

# Generate the local variables file (Overwrites if exists)
cat <<EOF > "${LOCAL_VARS}"
{
  enableNewUser = ${enable_new_user};

  username = "${username}";
  hashedPassword = "${hashed_password}";

  gitUsername = "${git_username}";
  gitEmail = "${git_email}";
}
EOF
echo "Generated ${LOCAL_VARS}"

# Build
nixos-generate-config --show-hardware-config > "${HARDWARE}"

if command -v systemctl >/dev/null 2>&1 && [[ -d /run/systemd/system ]]; then
  sudo /bin/sh -c "nixos-rebuild switch --flake 'path:${REPO_DIR}#${HOST}' --no-write-lock-file && systemctl reboot"
else
  sudo nixos-rebuild switch --flake "path:${REPO_DIR}#${HOST}" --no-write-lock-file
  echo "Switch complete. Reboot manually to log in as ${username}."
fi