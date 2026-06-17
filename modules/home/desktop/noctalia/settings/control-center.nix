# Noctalia settings control center module
# Provides Noctalia control center settings

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia.settings.control_center = {
      sidebar = "full";
      sidebar_section = "full";
    };
  };
}
