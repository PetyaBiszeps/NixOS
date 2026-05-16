# Home manager apps
# Provides a list of packages to install for the user

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
    localsend
    thunderbird
    # gnome-notes
    mission-center
    telegram-desktop
    gnome-calculator
    teamspeak6-client
  ];
}
