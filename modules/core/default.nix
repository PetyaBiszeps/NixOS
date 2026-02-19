# Core global import file
# Provides import for all /core modules
# Feel free to add, remove and modify anything here

{ inputs, ... }: {
  imports = [
    ./ly.nix
    ./nfs.nix
    ./fonts.nix
    ./steam.nix
    ./network.nix
    ./hardware.nix
    ./packages.nix
    ./security.nix
    ./nautilus.nix
    ./keyboard.nix
    ./printing.nix
    ./services.nix
    ./quickshell.nix
    ./var_connector.nix
    ./gaming_support.nix
    ./garbage_collector.nix
  ];
}