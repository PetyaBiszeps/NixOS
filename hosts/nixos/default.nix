# Nix nixos host configuration file
# Detects user hardware configuration to make proper build
# Enables display manager, sync GUI (Niri) session to be available to display manager

{ pkgs, lib, ... }: {
  imports = [
    (lib.mkIf (builtins.pathExists ./hardware.nix) ./hardware.nix)
    ./host-packages.nix
  ];

  # Display manager
  services.displayManager.ly.enable = true;

  # Enable niri session for display manager
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # Ensure niri session is available to display manager
  services.displayManager.defaultSession = "niri";
  services.displayManager.sessionPackages = [ pkgs.niri ];

  # NixOS current version (Don't remove that unless you know what you do)
  system.stateVersion = "26.05";
}