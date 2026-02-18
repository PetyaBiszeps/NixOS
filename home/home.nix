# Home.nix user configuration file
# 
#

{ pkgs, inputs, ... }: {
  home = {
    username = "yp00";
    homeDirectory = "/home/yp00";
    stateVersion = "24.11";
  };

  # Init
  programs.home-manager.enable = true;

  # Import
  imports = [
    inputs.niri.homeModules.niri

    ./niri.nix
  ];

  # Packages
  home.packages = with pkgs; [
    wget
    git gh
    ghostty
    neovim
    brave

    # Software
    telegram-desktop
    teamspeak6-client

    # Gaming
    gamescope
  ];
}
