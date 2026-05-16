# Gaming support module
# Provides general gaming support

{ config, lib, pkgs, ... }:
  let gamingSupportEnable = config.variables.gamingSupportEnable or false;
in
lib.mkIf gamingSupportEnable {
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt
    SDL2
    antimicrox
  ];
}
