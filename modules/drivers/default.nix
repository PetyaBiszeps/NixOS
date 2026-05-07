# Drivers global import file
# Provides import for all driver modules
# Be careful when editing this file, it controls driver imports

{ ... }: {
  imports = [
    ./amd-drivers.nix
  ];
}
