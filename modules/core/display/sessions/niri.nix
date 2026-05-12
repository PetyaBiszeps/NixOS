# Niri session module
# Provides Niri graphical session support
# Feel free to add, remove and modify anything here

{ inputs, pkgs, ... }: {
  imports = [ inputs.niri.nixosModules.niri ];

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  services.displayManager.defaultSession = "niri";
}
