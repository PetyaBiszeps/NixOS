# Nix system packages module
# Provides system packages for every system setup
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
  ];
}
