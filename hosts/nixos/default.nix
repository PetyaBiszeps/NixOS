# Nix default host configuration file
# Detects user hardware configuration to make proper build
# Feel free to add, remove and modify anything here

{ lib, ... }: {
  imports = [
    ./host-packages.nix
  ]
    # Users disks
  ++ lib.optional (builtins.pathExists ./disks.nix) ./disks.nix
    # Users hardware
  ++ lib.optional (builtins.pathExists ./hardware.nix) ./hardware.nix;

  # NixOS current version (Don't remove that unless you know what you do)
  system.stateVersion = "26.05";
}
