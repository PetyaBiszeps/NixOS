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

        capsule = true;
        
        radius = 0;
        padding = 8;
        thickness = 36;
        margin_edge = 0;
        margin_ends = 0;
      
        radius_bottom_left = -80;
        radius_bottom_right = -80;
      };
    };
  };
}
