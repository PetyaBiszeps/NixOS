# AGENTS.md

Top-level instructions for OpenAI Codex working in this repository.

## Context

This is a personal modular NixOS flake configuration.

Current repository shape:

- host: `hosts/nixos`
- profile: `profiles/amd.nix`
- system modules: `modules/core/`
- driver modules: `modules/drivers/`
- Home Manager modules: `modules/home/`
- shell modules: `modules/home/shell/`
- local/generated files: `hosts/*/{hardware.nix,disks.nix,variables.local.nix}`

The configuration uses NixOS, flakes, Home Manager, Niri, Noctalia, NVF, AMD graphics, development tooling, and gaming support.

Keep answers and changes focused. Prefer small patches over broad rewrites. Use docs as routing aids, not required reading.

## Read Strategy

Do not read the whole repo by default.

Start with the files directly relevant to the task.

Use:

- `README.md` for user-facing install/rebuild context.
- `docs/repository-map.md` when unsure where a change belongs.
- `docs/install-and-local-files.md` when editing `install.sh`, `mount.sh`, host variables, or generated/local files.
- other `docs/*.md` only when the task clearly matches a doc topic.
- nearby modules before introducing new patterns.

The `docs/` directory is for optional/situational notes. Do not require every task to create or read docs.

## Hard Rules

Do not:

- edit `flake.lock` unless explicitly asked
- run `nix flake update` unless explicitly asked
- run `nixos-rebuild`, cleanup, install scripts, or other system-changing commands unless explicitly asked
- edit `hosts/*/hardware.nix` unless the task is hardware-specific
- edit `hosts/*/disks.nix` unless the task is disk/mount-specific
- edit `hosts/*/variables.local.nix` unless explicitly asked
- move or rename modules unless explicitly asked
- add large abstractions for small changes
- add unrelated packages or services
- change unrelated files
- commit changes unless explicitly asked

Do:

- inspect relevant files before editing
- follow the existing module style
- keep modules small and focused
- preserve existing directory structure
- suggest validation commands instead of running them
- explain changed files briefly

## Style

Nix style in this repo prefers readable hand-written modules.

Prefer this shape when practical:

```nix
{ config, lib, pkgs, ... }:
  let
    value = "...";
in {
  options = {};
  config = {};
}
```

Guidelines:

- keep comments short and useful
- prefer existing names and patterns
- use `lib.mkIf` for feature toggles
- use `lib.optionalAttrs` for conditional attribute sets
- avoid unnecessary cleverness
- avoid formatting-only churn
- avoid broad rewrites

## Local Files

These are machine-specific and normally ignored by Git:

```text
hosts/*/hardware.nix
hosts/*/disks.nix
hosts/*/variables.local.nix
```

Treat them as generated/local state.

## Commands

Codex should not run these unless explicitly asked.

Safe checks to suggest:

```bash
nix flake check "path:." --no-write-lock-file
nix fmt
```

User rebuild aliases:

```bash
nixos-build
nixos-update
nixos-clean
nixos-build-clean
nixos-all
```

Direct rebuild command:

```bash
sudo nixos-rebuild switch --flake "path:.#nixos" --no-write-lock-file
```

Use `--no-write-lock-file` by default for rebuild/check commands.

## Task Summary

After changes, summarize:

- files changed
- what changed
- why
- suggested validation command

Keep the summary short.
