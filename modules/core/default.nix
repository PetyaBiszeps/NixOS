# Core global import file
# Provides import for all /core modules
# Be careful when modifying this file, as it may affect your system

{ ... }: {
  imports = [
    ./nix
    ./hardware
    
    ./ly.nix
    ./nfs.nix
    ./niri.nix
    ./boot.nix
    ./user.nix
    ./lact.nix
    ./time.nix
    ./fonts.nix
    ./steam.nix
    ./avahi.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./keyboard.nix
    ./services.nix
    ./xwayland.nix
    ./quickshell.nix
    ./web_support.nix
    ./var_connector.nix
    ./gaming_support.nix
  ];
}
