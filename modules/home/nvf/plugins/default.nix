# NVF Plugins default.nix module
# Provides modular aggregator for NVF Plugins setup

{ ... }: {
  imports = [
    ./git.nix
    ./cmdline.nix
    ./dashboard.nix
    ./telescope.nix
    ./colorizer.nix
    ./filesystem.nix
    ./statusline.nix
    ./completion.nix
    ./notifications.nix
  ];
}
