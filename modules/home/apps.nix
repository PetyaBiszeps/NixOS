# Home manager apps
# Provides a list of packages to install for the user
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    brave
    slack
    loupe
    discord
    spotify
    spotatui
    celluloid
    thunderbird
    # gnome-notes
    telegram-desktop
    gnome-calculator
    teamspeak6-client
  ];
}
