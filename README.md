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
nix-shell -p git openssh
```

### 3. (Optional) SSH clone
If you want to clone via SSH right after install:

```bash
ssh-keygen -t ed25519 -C "your@email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Add the printed public key to GitHub, then verify access:

```bash
ssh -T git@github.com
```

### 4. Clone and install
```bash
git clone git@github.com:PetyaBiszeps/NixOS.git
cd ~/Documents/Web/NixOS
chmod +x install.sh
./install.sh
```

If you prefer HTTPS instead of SSH, use:

```bash
git clone https://github.com/PetyaBiszeps/NixOS.git
```