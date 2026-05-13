# Niri user services
# Provides user systemd services used by the Niri session
# Be careful modifying this file, as it may affect the Niri session

{ pkgs, ... }: {
  # Xwayland Satellite support for Niri
  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "Xwayland outside Wayland";
      BindsTo = "graphical-session.target";
      After = "graphical-session.target";
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };

    Service = {
      Type = "notify";
      NotifyAccess = "all";
      Restart = "on-failure";
      StandardOutput = "journal";
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
    };

    Install.WantedBy = ["graphical-session.target"];
  };

  # Cliphist
  systemd.user.services.cliphist = {
    Unit = {
      Description = "Clipboard history";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
    };

    Install.WantedBy = ["graphical-session.target"];
  };
}
