# NixOS GUI configuration module file
# Created by YP00, so we have clean GUI configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  services.xserver.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  services.displayManager = {
    gdm.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    config.common.default = "*";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland,x11";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };
}
