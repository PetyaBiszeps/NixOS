# Nix system packages module
# Provides system packages for every system setup
# Feel free to add, remove and modify anything here

{ inputs, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs = {
    dconf.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    brave
    ghostty
    loupe celluloid # Image, Video
    gpu-screen-recorder
    docker-compose
    telegram-desktop
    teamspeak6-client
  ];
}