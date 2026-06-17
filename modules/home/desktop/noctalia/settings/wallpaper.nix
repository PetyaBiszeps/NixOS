# Noctalia wallpaper module
# Provides Noctalia wallpaper settings

{ lib, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia.settings.wallpaper = {
      enable = true;
      default.path = "/home/yp00/Pictures/Wallpapers/FF16.jpg";
    };
  };
}
