# Gaming modules collection module
# Provides a collection of gaming-related modules
# Be careful when adding or removing modules, as it may affect the system's gaming

{ ... }: {
  imports = [
    ./steam.nix
    ./support.nix
    ./controllers.nix
  ];
}
