# Noctalia settings default.nix module
# Provides modular aggregator for Noctalia settings

{
  imports = [
    ./bar.nix
    ./theme.nix
    ./wallpaper.nix
  ];
}
