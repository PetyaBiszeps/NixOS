# AGENTS.md

This file provides top-level guidance for OpenAI Codex when working in this repository.

## Project Context

This is a NixOS flake configuration. The active branch is `Niri`.

Primary goals:
- Keep changes small and focused.
- Preserve the existing repository structure.
- Keep the configuration beginner-friendly.
- Prefer existing patterns over new abstractions.
- Do not add unrelated packages, services, or refactors.

## Read These Docs When Relevant

Do not read every file in `docs/` by default. Read only the docs relevant to the task.

- `docs/architecture.md` — repository structure and configuration flow.
- `docs/codex-workflow.md` — how Codex should inspect, edit, test, and summarize changes.
- `docs/nixos-style.md` — Nix/NixOS style guidelines.
- `docs/hosts.md` — host-specific configuration rules.
- `docs/niri.md` — Niri desktop/session configuration.
- `docs/troubleshooting.md` — common build/debug commands.

## Hard Rules

Do not:
- Modify `flake.lock` unless explicitly requested.
- Edit `hosts/*/hardware.nix` unless the task is hardware-specific.
- Run `nixos-rebuild`, `nixos-rebuild-all`, `nix flake update`, garbage collection, or other system-changing commands unless explicitly requested.
- Perform broad refactors unless explicitly requested.
- Rename or move directories unless explicitly requested.
- Add unnecessary dependencies.
- Change unrelated files.
- Commit changes unless explicitly requested.

Do:
- Inspect relevant files before editing.
- Follow existing patterns.
- Prefer small, reviewable changes.
- Suggest an appropriate build/test command, but do not run it unless explicitly requested.
- Explain what changed and why.

## User Commands Reference

These commands are documented for the user. Codex should not run them unless explicitly requested.

Use `--no-write-lock-file` by default for rebuild commands to avoid accidental `flake.lock` changes.

```bash
# Default full rebuild workflow used by the user
nixos-rebuild-all

# Default cleanup workflow used by the user
nixos-delete-old

# Build and activate after reboot
sudo nixos-rebuild boot --flake "path:.#nixos" --no-write-lock-file

# Build and switch immediately
sudo nixos-rebuild switch --flake "path:.#nixos" --no-write-lock-file

# Build without switching
sudo nixos-rebuild build --flake "path:.#nixos" --no-write-lock-file

# Show detailed error trace
sudo nixos-rebuild build --flake "path:.#nixos" --show-trace --no-write-lock-file

# Update flake inputs only when explicitly requested
nix flake update
```

## Expected Task Summary

After making changes, Codex should summarize:

- Which files changed.
- What changed.
- Why the change was made.
- Which command the user can run to test it.

For most configuration changes, suggest:

```bash
nixos-rebuild-all
```

Do not run the command unless the user explicitly asks for it.
