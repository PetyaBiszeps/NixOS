# Core global import file
# Provides import for all /core modules

{ ... }: {
  imports = [
    ./nix
    ./user
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
    ./docker.nix
    ./network.nix
    ./localization.nix
    ./var_connector.nix
  ];
}
