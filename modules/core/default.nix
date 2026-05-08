# Core global import file
# Provides import for all /core modules
# Be careful when modifying this file, as it may affect your system

{ ... }: {
  imports = [
    ./nix
    ./gaming
    ./display
    ./desktop
    ./hardware
    ./security

    ./nfs.nix
    ./boot.nix
    ./lact.nix
    ./time.nix
    ./audio.nix
    ./fonts.nix
    ./tools.nix
    ./avahi.nix
    ./network.nix
    ./localization.nix
    ./var_connector.nix
  ];
}
