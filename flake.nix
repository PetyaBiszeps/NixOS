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

      inputs.nixpkgs = {
        follows = "nixpkgs";
      };
    };

    # Niri
    niri = {
      url = "github:YaLTeR/niri";
    };
  };

  outputs = { self, nixpkgs, home-manager, niri, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };

      modules = [
        # Nix config
        ./hosts/desktop/configuration.nix

	# Home manager init
	home-manager.nixosModules.home-manager

	# Home manager config
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.extraSpecialArgs = {
	    inherit inputs;
	  };
	  home-manager.users.yp00 = import ./home/home.nix;
	}
      ];
    };
  };
}
