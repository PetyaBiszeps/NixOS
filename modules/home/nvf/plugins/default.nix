# NVF Plugins default.nix module
# Provides modular aggregator for NVF Plugins setup

{ ... }: {
  imports = [
    ./cmdline.nix
    ./dashboard.nix
    ./telescope.nix
    ./filesystem.nix
    ./statusline.nix
    ./completion.nix
    ./notifications.nix
  ];
}
