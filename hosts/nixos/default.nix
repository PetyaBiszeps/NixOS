# Nix default host configuration file
# Detects user hardware configuration files (disks.nix / hardware.nix) to make proper build

{ lib, ... }: {
  imports = [
    # 
  ]
  ++ lib.optional (builtins.pathExists ./disks.nix) ./disks.nix           # Users disks
  ++ lib.optional (builtins.pathExists ./hardware.nix) ./hardware.nix;    # Users hardware

  system.stateVersion = "26.05";
}
