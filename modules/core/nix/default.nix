# Nix modules collection module
# Provides imports for Nix settings, garbage collection, and helper tools
# Be careful when modifying this file, as it may affect the entire system behaviour

{ ... }: {
  imports = [
    ./gc.nix
    ./tools.nix
    ./settings.nix
  ];
}
