# NixOS setup guide (Niri Edition)

This repository contains my system configuration files. It documents the journey from a fresh install to a fully functional development and gaming environment.

## Installation Steps
### 1. Base System Installation
- Download the official **NixOS ISO**
- Install the system using the **No Desktop Environment** option for a clean, CLI-only base

### 2. Core configuration
Once logged into the TTY, clone this repository and apply the settings:

```bash
1. **Run local git with nix-shell:**
nix-shell -p git

2. **Clone the repository:**
git clone https://github.com/PetyaBiszeps/NixOS.git ~/Documents/Web/NixOS
   cd ~/Documents/Web/NixOS
