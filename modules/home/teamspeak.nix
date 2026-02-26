# TeamSpeak home-manager module
# Provides TeamSpeak client installation
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    teamspeak6-client
  ];
}