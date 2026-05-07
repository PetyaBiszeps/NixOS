# Gaming modules collection module
# Provides a collection of gaming-related modules
# Feel free to add, remove and modify anything here

{ ... }: {
  imports = [
    ./steam.nix
    ./support.nix
    ./controllers.nix
  ];
}
