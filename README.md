# NixOS setup guide (Niri Edition)

This repository contains my system configuration files. It documents the journey from a fresh install to a fully functional development and gaming environment.

## Installation Steps
### 1. Base System Installation
- Download the official **NixOS ISO**
- Install the system using the **No Desktop Environment** option for a clean, CLI-only base

### 2. Prepare tools (TTY)
```bash
mkdir -p ~/Documents/Web
cd ~/Documents/Web
nix-shell -p git openssh gh
```

### 3. Clone and install
```bash
git clone https://github.com/PetyaBiszeps/NixOS.git
cd ~/Documents/Web/NixOS
chmod +x install.sh
./install.sh
```

The installer can generate an SSH key, authenticate GitHub via device-flow, and switch the repo remote to SSH.

### Rebuild after changes
```bash
sudo nixos-rebuild switch --flake "path:.#nixos" --no-update-lock-file
```

If you want to verify SSH, run `ssh -T git@github.com` after the installer completes.