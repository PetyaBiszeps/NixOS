# Nix default.nix module
# Provides modular aggregator for imports for Nix settings, garbage collection, and helper tools

{ ... }: {
  imports = [
    ./ld.nix
    ./gc.nix
    ./tools.nix
    ./settings.nix
  ];
}
