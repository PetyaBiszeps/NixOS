# NixOS setup guide (Niri Edition)

This repository contains my system configuration files. It documents the journey from a fresh install to a fully functional development and gaming environment.

## Installation Steps
### 1. Base System Installation
- Download the official **NixOS ISO**
- Install the system using the **No Desktop Environment** option for a clean, CLI-only base

### 2. Core configuration
Once logged into the TTY, clone this repository and apply the settings:

```bash
0. mkdir Documents && cd Documents && mkdir Web && cd Web # Create Documents/Web directory
1. nix-shell-p git # Run local git
2. git clone https://github.com/PetyaBiszeps/NixOS.git ~/Documents/Web/NixOS && cd ~/Documents/Web/NixOS && cd NixOS # Clone repo and move into
3. chmod +x install.sh && ./install.sh # run installation script
```
