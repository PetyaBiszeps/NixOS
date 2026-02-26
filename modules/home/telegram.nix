# Telegram home-manager module
# Provides Telegram installation
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    telegram-desktop
  ];
}