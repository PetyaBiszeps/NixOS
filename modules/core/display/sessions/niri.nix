# Niri session module
# Provides Niri graphical session support
# Feel free to add, remove and modify anything here

{ config, lib, pkgs, ... }:
  let defaultSession = config.variables.defaultSession or "niri";
in lib.mkIf (defaultSession == "niri") {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  services.displayManager = {
    defaultSession = "niri";

    sessionPackages = [
      pkgs.niri
    ];
  };
}
