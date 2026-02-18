# Global drivers configuration file
# Imports all necessary drivers (right now for AMD only)
#

{ ... }: {
  imports = [
    ./amd-drivers.nix
  ];
}