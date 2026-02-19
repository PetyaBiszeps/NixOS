#!/usr/bin/env bash

# strict mode
set -euo pipefail

# dirs
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VARS="${REPO_DIR}/hosts/default/variables.nix"

# vars check
if [[ ! -f "${VARS}" ]]; then
  echo "variables.nix not found: ${VARS}"
  exit 1
fi

# user validation
read -r -p "Enter new username: " username
read -r -s -p "Enter new password: " password
echo

# git validation
read -r -p "Enter git username: " git_username
read -r -p "Enter git email: " git_email

# validation check
if [[ -z "${username}" || -z "${password}" || -z "${git_username}" || -z "${git_email}" ]]; then
  echo "All fields are required. Aborting."
  exit 1
fi

# Hashing
if command -v mkpasswd >/dev/null 2>&1; then
  hashed_password="$(mkpasswd -m sha-512 "${password}")"
elif command -v openssl >/dev/null 2>&1; then
  hashed_password="$(openssl passwd -6 "${password}")"
else
  echo "No password hashing tool found (mkpasswd/openssl). Aborting."
  exit 1
fi

# Validation helper
escape_sed() {
  printf '%s' "$1" | sed -e 's/[\\/&|]/\\&/g'
}

# Fill data
username_esc="$(escape_sed "${username}")"
hashed_esc="$(escape_sed "${hashed_password}")"
git_user_esc="$(escape_sed "${git_username}")"
git_email_esc="$(escape_sed "${git_email}")"

sed -i \
  -e "s|^  username = .*;|  username = \"${username_esc}\";|" \
  -e "s|^  hashedPassword = .*;|  hashedPassword = \"${hashed_esc}\";|" \
  -e "s|^  gitUsername = .*;|  gitUsername = \"${git_user_esc}\";|" \
  -e "s|^  gitEmail = .*;|  gitEmail = \"${git_email_esc}\";|" \
  "${VARS}"

# Build
sudo nixos-rebuild switch --flake "${REPO_DIR}#default"