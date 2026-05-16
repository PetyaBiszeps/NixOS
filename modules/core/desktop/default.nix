# Desktop default.nix module
# Provides modular aggregator for desktop structure

{ ... }: {
  imports = [
    ./apps.nix
    ./portal.nix
    ./services.nix
  ];
}
