# Home modules import
# Placeholder for home-manager module list
# Feel free to add, remove and modify anything here

{ variables, lib, ... }:
  let vars = variables;
in {
  imports = [
    ./niri.nix
    ./ghostty.nix
  ];
}