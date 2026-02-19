# Nix default host configuration file
# Detects user hardware configuration to make proper build
# Enables display manager, sync GUI (Niri) session to be available to display manager

{ pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];

  # Display manager
  services.displayManager.ly.enable = true;

  # Keep niri available at system level
  programs.niri.package = pkgs.niri;

  # Ensure niri session is available to display manager
  services.displayManager.sessionPackages = [ pkgs.niri ];
}