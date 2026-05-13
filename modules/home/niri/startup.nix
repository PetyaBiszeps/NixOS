# Niri startup applications
# Provides applications launched when the Niri session starts
# Feel free to add, remove and modify anything here

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "";
in {
  programs.niri.settings.spawn-at-startup = 
    lib.optionals (desktopShell == "noctalia") [
      { argv = ["noctalia-shell"]; }
    ];
}
