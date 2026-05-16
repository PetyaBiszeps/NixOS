# Niri user services module
# Provides user systemd services used by the Niri session

{ pkgs, ... }: {
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
