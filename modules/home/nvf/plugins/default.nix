# NVF Plugins default.nix module
# Provides modular aggregator for NVF Plugins setup

{ ... }: {
  imports = [
    ./oil.nix
    ./input.nix
    ./dashboard.nix
    ./telescope.nix
    ./statusline.nix
    ./notifications.nix
    ./autocompletion.nix
  ];
}
