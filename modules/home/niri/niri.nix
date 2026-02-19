# Niri configuration file
# Provides Niri configuration control
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Install Niri and related packages
    niri
    grim
    slurp
    wl-clipboard
  ];
}