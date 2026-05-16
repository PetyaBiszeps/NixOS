# Display sessions default.nix module
# Provides modular aggregator for available graphical session modules

{ ... }: {
  imports = [
    ./niri.nix
  ];
}
