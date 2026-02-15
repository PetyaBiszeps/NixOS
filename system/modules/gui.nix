# NixOS GUI configuration module file
# Created by YP00, so we have clean GUI configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
}
