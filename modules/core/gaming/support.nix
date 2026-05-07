# Gaming support module
# Provides general gaming support
# Be careful when adding or removing modules, as it may affect the system's gaming

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
