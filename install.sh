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

# Generate the local variables file (Overwrites if exists)
cat <<EOF > "${LOCAL_VARS}"
{
  username = "${username}";
  hashedPassword = "${hashed_password}";
  gitUsername = "${git_username}";
  gitEmail = "${git_email}";
}
EOF
echo "Generated ${LOCAL_VARS}"

# Build
nixos-generate-config --show-hardware-config > "${HARDWARE}"
sudo nixos-rebuild switch --flake "${REPO_DIR}#${HOST}" && sudo reboot