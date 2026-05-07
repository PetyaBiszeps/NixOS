# Nix system packages module
# Provides system packages for every system setup
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  programs = {
    dconf.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
    # gnome-notes
    docker-compose
    loupe celluloid # Image, Video
    # gnome-calculator
    gpu-screen-recorder
  ];
}
