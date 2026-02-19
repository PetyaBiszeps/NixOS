#
#
#

{
  descriptions = "NixOS configuration";

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

  outputs = {};
}







#{
#  outputs = { self, nixpkgs, home-manager, niri, ... }@inputs: {
#    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
#      system = "x86_64-linux";
#      specialArgs = {
#        inherit inputs;
#      };
#
#      modules = [
#        # Nix config
#        ./hosts/desktop/configuration.nix
#
#        # Home manager init
#        home-manager.nixosModules.home-manager
#
#        # Home manager config
#        {
#          home-manager.useGlobalPkgs = true;
#	      home-manager.useUserPackages = true;
#	      home-manager.extraSpecialArgs = {
#	        inherit inputs;
#	      };
#	      home-manager.users.yp00 = import ./home/home.nix;
#	    }
#      ];
#    };
#  };
#}