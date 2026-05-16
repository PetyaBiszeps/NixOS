# Hardware default.nix modules
# Provides modular aggregator for hardware-related core modules

{ ... }: {
  imports = [
    ./firmware.nix
    ./graphics.nix
    ./scanning.nix
    ./printing.nix
    ./bluetooth.nix
  ];
}
