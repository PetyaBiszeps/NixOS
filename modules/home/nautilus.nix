# Nautilus file manager module
# Provides nautilus file manager
# Be careful when modifying this module, as it may break your file manager

{ lib, pkgs, variables, ... }:
  let nautilusEnable = variables.nautilusEnable or false;
in lib.mkIf nautilusEnable {
  home.packages = with pkgs; [
    nautilus
    ffmpegthumbnailer
  ];
}
