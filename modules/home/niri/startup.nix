# Niri startup applications module
# Provides applications launched when the Niri session starts

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "";
in {
  programs.niri.settings.spawn-at-startup = 
    lib.optionals (desktopShell == "noctalia") [
      { argv = ["noctalia"]; }
    ];
}
