# Security default.nix module
# Provides modular aggregator for security-related system modules

{ ... }: {
  imports = [
    ./polkit.nix
  ];
}
