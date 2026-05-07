# Hardware modules collection
# Provides hardware-related core modules
# Be careful modifying any of these, as they are controlling the hardware setup

{ ... }: {
  imports = [
    ./firmware.nix
    ./graphics.nix
    ./scanning.nix
    ./printing.nix
    ./bluetooth.nix
  ];
}
