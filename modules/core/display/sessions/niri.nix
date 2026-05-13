# Niri session module
# Provides Niri graphical session support
# Feel free to add, remove and modify anything here

{ config, lib, inputs, pkgs, ... }:
  let defaultSession = config.variables.defaultSession or "niri";
in {
  imports = [ inputs.niri.nixosModules.niri ];

  config = lib.mkIf (defaultSession == "niri") {
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    services.displayManager.defaultSession = "niri";
  };
}
