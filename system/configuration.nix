# Global NixOS configuration file
# Modified by YP00, so we have clean configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ config, pkgs, ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix

    ./modules/audio.nix
    ./modules/bootLoader.nix
    ./modules/dev.nix
    ./modules/fileManager.nix
    ./modules/fonts.nix
    ./modules/gui.nix
    ./modules/locales.nix
    ./modules/network.nix
    ./modules/packageManager.nix
    ./modules/packages.nix
    ./modules/user.nix
    ./modules/gaming.nix
    ./modules/graphics.nix
    ./modules/themes.nix
  ];

  # NixOS current version (Don't remove that unless you know what you do)
  system.stateVersion = "25.11";
}
