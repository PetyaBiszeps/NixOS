# Home manager apps
# Provides a list of packages to install for the user
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    brave
    slack
    loupe
    # discord -> vesktop is a better alternative
    vesktop
    spotify
    spotatui
    obsidian
    celluloid
    thunderbird
    # gnome-notes
    mission-center
    telegram-desktop
    gnome-calculator
    teamspeak6-client
  ];
}
