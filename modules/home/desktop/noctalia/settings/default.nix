# Noctalia settings default.nix module
# Provides modular aggregator for Noctalia settings

{
  imports = [
    ./bar.nix
    ./theme.nix
    ./panels.nix
    ./widgets.nix
    ./location.nix
    ./wallpaper.nix
    ./control-center.nix
  ];
}
