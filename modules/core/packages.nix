# Nix system packages module
# Provides system packages for every system setup
# Feel free to add, remove and modify anything here

{ inputs, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs = {
    dconf.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    # gnome-notes
    docker-compose
    loupe celluloid # Image, Video
    # gnome-calculator
    gpu-screen-recorder
  ];
}