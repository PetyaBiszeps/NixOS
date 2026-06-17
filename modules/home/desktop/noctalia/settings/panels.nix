# Noctalia panel module
# Provides popup panel placement settings

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia.settings.shell.panel = {
      open_near_click_control_center = true;
    };
  };
}
