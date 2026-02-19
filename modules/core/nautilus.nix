# Nautilus file manager module
# Provides nautilus as main file manager in this repo
# Feel free to add, remove and modify anything here

{ config, pkgs, lib, ... }:
  let nautilusEnable = config.variables.nautilusEnable or false;
in lib.mkIf nautilusEnable {
  programs.nautilus.enable = true;

  environment.systemPackages = [
    pkgs.ffmpegthumbnailer
  ];
}