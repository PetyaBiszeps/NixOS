# Ly display manager module
# Provides Ly display manager configuration
# Be careful modifying this module, as it may break the display manager

{ config, lib, ... }:
  let displayManager = config.variables.displayManager or "ly";
in lib.mkIf (displayManager == "ly") {
  services.displayManager.ly = {
    enable = true;

    settings = {
      save = false;
      xinitrc = null;
      xsessions = null;
      animation = "matrix"; # -> "doom", "colormix", "matrix"
      save_file = "/var/lib/ly/save";
      hide_users = "nixbld1,nixbld2,nixbld3,nixbld4,nixbld5,nixbld6,nixbld7,nixbld8,nixbld9,nixbld10,nixbld11,nixbld12,nixbld13,nixbld14,nixbld15,nixbld16,nixbld17,nixbld18,nixbld19,nixbld20,nixbld21,nixbld22,nixbld23,nixbld24,nixbld25,nixbld26,nixbld27,nixbld28,nixbld29,nixbld30,nixbld31,nixbld32";
      default_input = "password";
      # hide_borders = true;
      hide_system_users = true;
      # min_refresh_delta = 5;
    };
  };

  # Temporary files
  systemd.tmpfiles.rules = [
    "d /var/lib/ly 0755 root root -"
  ];
  security.pam.services.ly.enableGnomeKeyring = true;
}
