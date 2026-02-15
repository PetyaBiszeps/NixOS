# NixOS file manager configuration module file
# Created by YP00, so we have clean file manager configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  services.gvfs.enable = true; # -> Trashbox
}
