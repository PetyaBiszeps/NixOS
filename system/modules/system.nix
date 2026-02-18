# NixOS system configuration module file
# Created by YP00, so we have clean system configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
}
