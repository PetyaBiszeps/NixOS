# Polkit module
# Provides Polkit authorization rules

{ config, lib, ... }:
  let
    desktopShell = config.variables.desktopShell or "";
    defaultSession = config.variables.defaultSession or "";

    useNoctaliaNiri = defaultSession == "niri" && desktopShell == "noctalia";
in {
  security.polkit = {
    enable = true;

    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (subject.isInGroup("users") && (
          action.id == "org.freedesktop.login1.reboot" ||
          action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
          action.id == "org.freedesktop.login1.power-off" ||
          action.id == "org.freedesktop.login1.power-off-multiple-sessions"
        )) {
          return polkit.Result.YES;
        }
      });
    '';
  };

  systemd.user.services.niri-flake-polkit.enable =
      lib.mkIf useNoctaliaNiri false;
}
