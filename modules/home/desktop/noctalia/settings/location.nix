# Noctalia location module
# Provides location for weather, night light, and auto theme

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia.settings.location = {
      auto_locate = true;
    };
  };
}
