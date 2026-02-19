# Nix system packages module
# Provides system packages for every system setup
# Feel free to add, remove and modify anything here

{ inputs, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs = {
    dconf.enable = true;
    firefox.enable = true;

    neovim = {
      enable = true;
      defaultEditor = false;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    ghostty
    docker-compose
    telegram-desktop
    teamspeak-client6

    # Specific packages
    inputs.zen-browser.packages.${pkgs.system}.default  # Zen Browser
  ];
}