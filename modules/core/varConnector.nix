# Variable connector file
# Provides bridge connection between variables.nix and other *.nix files
# Feel free to add, remove and modify anything here

{ lib, hostname, ... }: let vars = import ../../hosts/${hostname}/variables.nix;
in {
  options.variables = lib.mkOption {
    type = lib.types.attrs;
    default = {};
  };

  config.variables = vars;
}