# Nix default host configuration file
# Detects user hardware configuration to make proper build
# Enables display manager, sync GUI (Niri) session to be available to display manager

{ pkgs, ... }: {
  # Imports
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];

  # Enable display manager (SDM as default)
  services.displayManager.sdm.enable = true;

  # Keep niri available at system level for ly
  programs.niri.package = pkgs.niri;

  # Ensure niri session is available to display manager
  services.displayManager.sessionPackages = [ pkgs.niri ];
}