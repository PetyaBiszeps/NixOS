# Boot module
# Provides boot setup
# Feel free to add, remove and modify anything here

{ pkgs, config, ... }: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}