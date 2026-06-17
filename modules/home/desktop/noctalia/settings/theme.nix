# Noctalia theme module
# Provides Noctalia theme settings

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia.settings.theme = {
      mode = "dark";
      source = "builtin";
      builtin = "Catppuccin";
    };
  };
}
