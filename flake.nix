# Global Nix Flake
# Provides build wrapper for whole system

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
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia (Built on QuickShell)
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # NVF
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secure Boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
      };

      mkHost = { hostname, profile }: lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs hostname profile;
        };

        modules = [
          ./hosts/${hostname}
          ./profiles/${profile}.nix
          ./modules/core
          ./modules/drivers

          home-manager.nixosModules.home-manager
          inputs.niri.nixosModules.niri
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
  in {
    formatter.${system} = pkgs.alejandra;

    nixosConfigurations = {
      nixos = mkHost {
        hostname = "nixos";
        profile = "amd";
      };
    };
  };
}
