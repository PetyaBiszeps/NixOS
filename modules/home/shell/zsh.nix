# Shell Zsh module
# Provides zsh configuration

{ lib, variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in lib.mkIf (defaultShell == "zsh") {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Aliases
    shellAliases = {
      nixos-all = "nix flake update && sudo nixos-rebuild switch --flake \"path:.#nixos\" --no-write-lock-file && sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d";
      nixos-build = "sudo nixos-rebuild switch --flake \"path:.#nixos\" --no-write-lock-file";
      nixos-update = "nix flake update && sudo nixos-rebuild switch --flake \"path:.#nixos\" --no-write-lock-file";
      nixos-clean = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d";
      nixos-build-clean = "sudo nixos-rebuild switch --flake \"path:.#nixos\" --no-write-lock-file && sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d";
    };

    # History
    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    # Extra
    initContent = "fastfetch";
  };
}
