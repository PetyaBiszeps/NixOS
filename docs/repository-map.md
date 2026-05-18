# Repository Map

Compact context for Codex. Read this only when a task needs repository structure or module placement.

## Top Level

```text
flake.nix      # flake inputs, formatter, host definitions
install.sh     # interactive fresh-install helper
mount.sh       # interactive extra disk mount generator
README.md      # user-facing setup/rebuild guide
AGENTS.md      # short Codex rules
docs/          # optional task-specific notes
```

## Hosts

Current host:

```text
hosts/nixos/
```

Important files:

```text
default.nix          # host entrypoint
variables.nix        # host defaults and feature toggles
variables.local.nix  # generated/private local values
hardware.nix         # generated hardware config
disks.nix            # generated optional mounts
```

Normally edit `variables.nix` for defaults and toggles.

Do not edit `variables.local.nix`, `hardware.nix`, or `disks.nix` unless the task is specifically about those files.

## Profiles

```text
profiles/amd.nix
```

The active profile imports AMD-specific configuration.

Use profiles for hardware/profile-level choices, not user app configuration.

## System Modules

```text
modules/core/
```

Use for NixOS-level configuration:

- boot
- nix settings
- users
- Home Manager bridge
- display manager
- desktop services
- audio
- networking
- security
- gaming
- docker
- hardware support
- localization

If a setting needs root/system services, it likely belongs in `modules/core/`.

## Driver Modules

```text
modules/drivers/
```

Use for driver-specific configuration such as AMD GPU support.

## Home Manager Modules

```text
modules/home/
```

Use for user-level applications and dotfile-style configuration:

- Niri user config
- Noctalia / Quickshell
- NVF
- Ghostty
- Git
- GTK
- Zed
- Yazi
- Fastfetch
- desktop apps
- development packages

## Shell Modules

```text
modules/home/shell/
```

Use for shell tools and shell integrations:

- zsh
- oh-my-posh
- atuin
- zoxide
- fzf
- eza
- bat
- fd
- ripgrep

Keep each tool in its own focused module.

## Placement Rule

Ask:

1. Is it system-wide or a service? Use `modules/core/`.
2. Is it hardware/driver-specific? Use `modules/drivers/` or `profiles/`.
3. Is it user app config? Use `modules/home/`.
4. Is it shell CLI behavior? Use `modules/home/shell/`.
5. Is it host-specific data? Use `hosts/nixos/variables.nix`.
