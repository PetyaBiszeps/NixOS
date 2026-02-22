# Nautilus file manager module
# Provides nautilus as main file manager in this repo
# Feel free to add, remove and modify anything here

{ config, pkgs, lib, ... }:
  let nautilusEnable = config.variables.nautilusEnable or false;
in lib.mkIf nautilusEnable {
  environment.systemPackages = [
    pkgs.nautilus
    pkgs.ffmpegthumbnailer
    pkgs.nautilus-admin-gtk4
    pkgs.nautilus-open-any-terminal
  ];
}