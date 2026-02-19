# Global Nix Flake
# Provides build for the system
# Feel free to add, remove and modify anything here

{
  description = "NixOS configuration";

  inputs = {
    # NixOS packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri
    niri = {
      url = "github:YaLTeR/niri";
    };

    # NVF
    nvf = {
      url = "github:notashelf/nvf";
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

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      mkHost = { hostname, profile }:
        lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs hostname profile;
          };

          modules = [
            ./hosts/${hostname}
            ./profiles/${profile}
            ./modules/core
            ./modules/drivers
            home-manager.nixosModules.home-manager
          ];
        };
    in {
      nixosConfigurations = {
        default = mkHost {
          hostname = "default";
          profile = "amd";
        };
      };
    };
}
