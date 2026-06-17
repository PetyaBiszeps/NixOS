# Noctalia widgets module
# Provides Noctalia widgets settings

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia.settings.widget = {
      clock = {
        format = "{:%A, %H:%M}";
      };
      
      tray = {
        drawer = true;
        drawer_columns = 4;
      };

      network = {
        show_label = false;
      };
    };
  };
}
