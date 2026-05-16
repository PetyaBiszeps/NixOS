# Niri default.nix module
# Provides modular aggregator for Niri setup config and module imports

{
  imports = [
    ./input.nix
    ./styles.nix
    ./startup.nix
    ./packages.nix
    ./keybinds.nix
    ./services.nix
  ];
}
