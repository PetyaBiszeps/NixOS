# Global nix flake configuration
# Allows to control package versions
# flake.lock will be generated automatically

{
  description = "NixOS config";

  inputs = {
    # NixOS packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri
    niri = {
      url = "github:YaLTeR/niri";
    };

    # QuickShell
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
  };

  outputs = {}@inputs: {};
}