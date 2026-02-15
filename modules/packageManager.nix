# NixOS package manager configuration module file
# Created by YP00, so we have clean package manager configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true; # -> Allow unfree packages
  nix.settings.experimental-features = ["flakes" "nix-command"];
}
