# Discord home-manager module
# Provides Discord installation
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
  ];
}