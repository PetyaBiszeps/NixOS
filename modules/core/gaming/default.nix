# Gaming modules default.nix module
# Provides modular aggregator for a collection of gaming-related modules

{ ... }: {
  imports = [
    ./steam.nix
    ./support.nix
    ./controllers.nix
  ];
}
