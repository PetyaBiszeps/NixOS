# Niri global configuration
# Provides Niri setup configuration
# Feel free to add, remove and modify anything here

{ variables, pkgs, ... }:
let
  browser = variables.browser or "firefox";
  terminal = variables.terminal or "ghostty";
in {
  home.packages = with pkgs; [
    niri
    grim
    slurp
    wl-clipboard
  ];
}