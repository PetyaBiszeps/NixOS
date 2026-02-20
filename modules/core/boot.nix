# Boot module
# Provides boot setup
# Feel free to add, remove and modify anything here

{ pkgs, config, ... }: {
  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    loader.timeout = 0;
    loader.efi.canTouchEfiVariables = true;
  };
}