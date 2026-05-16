# Steam module
# Provides Steam gaming support

{ config, lib, pkgs, ... }:
  let gamingSupportEnable = config.variables.gamingSupportEnable or false;
in lib.mkIf gamingSupportEnable {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
    dedicatedServer.openFirewall = false;

    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };

  # Additional Steam packages
  environment.systemPackages = with pkgs; [
    mangohud
    samrewritten
  ];
}
