# NixOS install package configuration module file
# Created by YP00, so we have clean package install configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    git gh
    grim slurp wl-clipboard
    pulsemixer
    ghostty gcc
    nautilus
    neovim
    brave

    xdg-user-dirs
    adwaita-icon-theme
    gnumake
    unzip

    # GUI
    rofi
    waybar

    # Development
    docker-compose

    # Software
    telegram-desktop
    teamspeak6-client
  ]; 
}
