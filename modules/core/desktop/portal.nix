# XDG portal module
# Provides desktop portal support for Wayland applications

{ config, lib, pkgs, ... }:
  let defaultSession = config.variables.defaultSession or "";
in lib.mkIf (defaultSession != "niri") {
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
