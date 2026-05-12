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
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NVF
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # QuickShell
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
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
