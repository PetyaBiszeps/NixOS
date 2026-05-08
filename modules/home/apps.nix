# Home manager apps
# Provides a list of packages to install for the user
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    brave
    discord
    spotify
    spotatui
    telegram-desktop
    teamspeak6-client
  ];
}
