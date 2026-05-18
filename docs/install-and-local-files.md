# Install, Mount, and Local Files

Compact context for Codex. Read this when editing `install.sh`, `mount.sh`, host variables, or generated files.

## Fresh Install Flow

`install.sh` is the main bootstrap helper.

It currently uses:

```bash
HOST="${HOST:-nixos}"
```

Typical command:

```bash
HOST=nixos ./install.sh
```

Main responsibilities:

1. validate repository layout
2. validate or create host directory
3. collect local user info
4. optionally create a new user
5. collect optional git identity
6. optionally generate SSH key
7. optionally authenticate GitHub through `gh`
8. optionally switch GitHub origin from HTTPS to SSH
9. write `hosts/<host>/variables.local.nix`
10. generate `hosts/<host>/hardware.nix`
11. run `nix flake check`
12. optionally run `nixos-rebuild switch`

The installer should stay interactive, readable, and conservative.

## Generated Local Files

These files are local machine state:

```text
hosts/*/variables.local.nix
hosts/*/hardware.nix
hosts/*/disks.nix
```

Rules:

- do not commit machine secrets or generated hardware data
- do not overwrite without backup or confirmation
- keep generated files simple and readable
- prefer `--no-write-lock-file` for validation/rebuild commands

## Host Variables

Default values live in:

```text
hosts/nixos/variables.nix
```

Private generated values live in:

```text
hosts/nixos/variables.local.nix
```

`variables.nix` imports `variables.local.nix` when it exists.

Current important toggles:

```nix
enableNFS = false;
printEnable = true;
devSupportEnable = true;
gamingSupportEnable = true;

displayManager = "ly";
defaultSession = "niri";
desktopShell = "noctalia";
defaultShell = "zsh";

IDE = "zeditor";
browser = "brave";
terminal = "ghostty";
fileManager = "nautilus";
```

Use these variables instead of hardcoding app names in modules when possible.

## Mount Flow

`mount.sh` generates optional disk mounts.

It currently uses:

```bash
HOST="${HOSTNAME:-nixos}"
```

Typical command:

```bash
HOSTNAME=nixos ./mount.sh
```

It writes:

```text
hosts/<host>/disks.nix
```

Generated mounts use UUIDs and this option style:

```nix
options = [ "nofail" "x-systemd.automount" "x-systemd.idle-timeout=60" ];
```

Known improvement: `mount.sh` says `Run nixos-rebuild-all now?`, but the current repo aliases are `nixos-build`, `nixos-update`, `nixos-clean`, `nixos-build-clean`, and `nixos-all`. Prefer renaming that prompt if editing the script.

## Rebuild Commands

Direct command:

```bash
sudo nixos-rebuild switch --flake "path:.#nixos" --no-write-lock-file
```

Safe validation command:

```bash
nix flake check "path:." --no-write-lock-file
```

Formatting:

```bash
nix fmt
```

Do not run system-changing commands unless the user explicitly asks.
