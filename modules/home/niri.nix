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

  xdg.configFile."niri/config.kdl".text = ''
    // Minimal niri config
    binds {
      Mod+Return hotkey-overlay-title="Open Terminal: ${terminal}" { spawn "${terminal}"; }
      Mod+B hotkey-overlay-title="Open Browser: ${browser}" { spawn "${browser}"; }
      Mod+C hotkey-overlay-title="Close Window" { close-window; }
      Mod+R hotkey-overlay-title="Run an Application: fuzzel" { spawn "fuzzel"; }
    }
  '';
}