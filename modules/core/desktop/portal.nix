# XDG portal module
# Provides desktop portal support for Wayland applications
# Be careful modifying this module, as it affects system applications stability

{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
