# Nix modules collection module
# Provides imports for Nix settings, garbage collection, and helper tools
# Be careful when modifying this file, as it may affect the entire system

{ ... }: {
  imports = [
    ./settings.nix
    ./gc.nix
    ./tools.nix
  ];
}
