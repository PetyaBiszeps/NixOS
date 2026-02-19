# Core global import file
# Provides import for all /core modules
# Feel free to add, remove and modify anything here

{ inputs, ... }: {
  imports = [
    ./ly.nix
    ./nfs.nix
    ./varConnector.nix
  ];
}