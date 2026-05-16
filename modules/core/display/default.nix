# Display modules default.nix module
# Provides modular aggregator for display manager and graphical session modules

{ ... }: {
  imports = [
    ./managers
    ./sessions

    ./xwayland.nix
  ];
}
