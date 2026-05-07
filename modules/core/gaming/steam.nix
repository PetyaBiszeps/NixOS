# Steam module
# Provides Steam gaming support
# Important module for gaming, feel free to change, but be careful

{ pkgs, ... }: {
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
