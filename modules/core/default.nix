# Core global import file
# Provides import for all /core modules
# Be careful when modifying this file, as it may affect your system

{ ... }: {
  imports = [
    ./nix
    ./gaming
    ./display
    ./hardware
    
    ./nfs.nix
    ./boot.nix
    ./lact.nix
    ./time.nix
    ./fonts.nix
    ./tools.nix
    ./avahi.nix
    ./network.nix
    ./localization.nix
    ./var_connector.nix
  ];
}
