# Nix helper tools module
# Provides Nix maintenance and build inspection tools
# Be careful when modifying this file, as it may affect Nix tools that presented in your system

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nvd
    nil
    nixd
    statix
    deadnix
    # alejandra -> added to flake as default formatter, use as "nix fmt"
    # nixpkgs-fmt -> both nixpkgs-fmt and alejandra are formatters, alejandra is preferred
    nix-output-monitor
  ];
}
