# Core global import file
# Provides import for all /core modules
# Be careful when modifying this file, as it may affect your system

{ ... }: {
  imports = [
    ./nix
    ./gaming
    ./hardware
    
    ./ly.nix
    ./nfs.nix
    ./niri.nix
    ./boot.nix
    ./lact.nix
    ./time.nix
    ./fonts.nix
    ./avahi.nix
    ./network.nix
    ./keyboard.nix
    ./var_connector.nix
  ];
}
