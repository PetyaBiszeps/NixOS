#!/usr/bin/env bash

# strict mode
set -euo pipefail

# dirs
HOST="${HOSTNAME:-nixos}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST_DIR="${REPO_DIR}/hosts/${HOST}"
DISKS_FILE="${HOST_DIR}/disks.nix"

# host dir check
if [[ ! -d "${HOST_DIR}" ]]; then
  echo "Host directory not found: ${HOST_DIR}"
  echo "Set HOSTNAME to an existing host folder under hosts/"
  exit 1
fi

# lsblk check
if ! command -v lsblk >/dev/null 2>&1; then
  echo "lsblk not found. Install util-linux and re-run."
  exit 1
fi

labels=()
uuids=()
fstypes=()

is_duplicate() {
  local value="$1"
  shift
  local item
  for item in "$@"; do
    if [[ "${item}" == "${value}" ]]; then
      return 0
    fi
  done
  return 1
}

while true; do
  mapfile -t disk_rows < <(lsblk -rno NAME,SIZE,FSTYPE,UUID,MOUNTPOINT,LABEL)

  echo "Available disks:"
  echo "# NAME SIZE FSTYPE UUID MOUNTPOINT LABEL"
  disk_count=0
  for row in "${disk_rows[@]}"; do
    read -r name size fstype uuid mnt label <<< "${row}"
    if [[ -z "${uuid}" ]]; then
      continue
    fi
    disk_count=$((disk_count + 1))
    printf "%s %s\n" "${disk_count}." "${name} ${size} ${fstype:-?} ${uuid} ${mnt:-"-"} ${label:-"-"}"
  done

  if [[ "${disk_count}" -eq 0 ]]; then
    echo "No disks with UUID found."
    exit 1
  fi

  echo
  read -r -p "Select disk number (blank to finish): " selection
  if [[ -z "${selection}" ]]; then
    break
  fi

  if [[ ! "${selection}" =~ ^[0-9]+$ ]] || [[ "${selection}" -lt 1 ]] || [[ "${selection}" -gt "${disk_count}" ]]; then
    echo "Invalid selection."
    echo
    continue
  fi

  current_index=0
  selected_fstype=""
  selected_uuid=""

  for row in "${disk_rows[@]}"; do
    read -r name size fstype uuid mnt label <<< "${row}"
    if [[ -z "${uuid}" ]]; then
      continue
    fi
    current_index=$((current_index + 1))
    if [[ "${current_index}" -eq "${selection}" ]]; then
      selected_fstype="${fstype}"
      selected_uuid="${uuid}"
      break
    fi
  done

  if [[ -z "${selected_uuid}" ]]; then
    echo "Selection not found."
    echo
    continue
  fi

  if is_duplicate "${selected_uuid}" "${uuids[@]}"; then
    echo "Disk already added: ${selected_uuid}"
    echo
    continue
  fi

  if [[ -z "${selected_fstype}" ]]; then
    read -r -p "Filesystem type not detected. Enter fsType (e.g. ext4, btrfs, ntfs3): " selected_fstype
  fi

  label=""
  while [[ -z "${label}" ]]; do
    read -r -p "Enter mount label (folder name under /mnt): " label
    if [[ -z "${label}" ]]; then
      echo "Label is required."
      continue
    fi
    if [[ ! "${label}" =~ ^[A-Za-z0-9._-]+$ ]]; then
      echo "Label must match [A-Za-z0-9._-]."
      label=""
      continue
    fi
  done

  if is_duplicate "${label}" "${labels[@]}"; then
    echo "Label already used: ${label}"
    echo
    continue
  fi

  labels+=("${label}")
  uuids+=("${selected_uuid}")
  fstypes+=("${selected_fstype}")
  echo "Added /mnt/${label} -> UUID ${selected_uuid} (${selected_fstype})"
  echo
done

if [[ "${#labels[@]}" -eq 0 ]]; then
  echo "No disks added. Nothing written."
  exit 0
fi

cat <<EOF > "${DISKS_FILE}"
{
  fileSystems = {
EOF

for i in "${!labels[@]}"; do
  label="${labels[$i]}"
  uuid="${uuids[$i]}"
  fstype="${fstypes[$i]}"
  cat <<EOF >> "${DISKS_FILE}"
    "/mnt/${label}" = {
      device = "/dev/disk/by-uuid/${uuid}";
      fsType = "${fstype}";
      options = [ "nofail" "x-systemd.automount" "x-systemd.idle-timeout=60" ];
    };
EOF
done

cat <<EOF >> "${DISKS_FILE}"
  };
}
EOF

echo "Generated ${DISKS_FILE}"