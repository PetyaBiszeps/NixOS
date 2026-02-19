# Nix system packages module
# Provides system packages for every system setup
# Feel free to add, remove and modify anything here

{ pkgs, lib, zen-browser, hostname, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs = {
    adb.enable = true;
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
    zen-browser
    docker-compose
    # telegram-desktop --> communication module
    # teamspeak-client6 --> communication module
  ];
}