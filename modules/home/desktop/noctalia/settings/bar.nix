# Noctalia bar module
# Provides Noctalia bar settings

{ lib, variables, ... }:

let
  desktopShell = variables.desktopShell or "none";
in {
  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia.settings.bar = {
      main = {
        enabled = true;
        position = "top";

        radius = 8;
        padding = 8;
        thickness = 36;
        margin_edge = 8;
        margin_ends = 8;
      };
    };
  };
}
