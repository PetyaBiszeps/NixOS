# Niri session module
# Provides Niri graphical session support

{ config, lib, pkgs, inputs, ... }:
  let defaultSession = config.variables.defaultSession or "niri";
in lib.mkIf (defaultSession == "niri") {
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  services.displayManager.defaultSession = "niri";
}
