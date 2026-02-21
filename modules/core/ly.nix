# Ly display manager configuration
# Provides setup specifically for ly
# Feel free to add, remove and modify anything here

{ config, lib, pkgs, ... }: {
  # Ensure greetd is disabled when ly is enabled
  services.greetd.enable = lib.mkIf config.services.displayManager.ly.enable (lib.mkForce false);

  # Enable ly with the matrix animation
  # Animations: "doom", "colormix", "matrix"
  services.displayManager.ly = {
    enable = lib.mkDefault false;

    settings = {
      save = true;
      xinitrc = null;
      xsessions = null;
      animation = "matrix";
      save_file = "/var/lib/ly/save";
      default_input = "password";
      # hide_borders = true;
      hide_system_users = true;
      # min_refresh_delta = 5;
      hide_users = [
        "nixbld1"
        "nixbld2"
        "nixbld3"
        "nixbld4"
        "nixbld5"
        "nixbld6"
        "nixbld7"
        "nixbld8"
        "nixbld9"
        "nixbld10"
        "nixbld11"
        "nixbld12"
        "nixbld13"
        "nixbld14"
        "nixbld15"
        "nixbld16"
        "nixbld17"
        "nixbld18"
        "nixbld19"
        "nixbld20"
        "nixbld21"
        "nixbld22"
        "nixbld23"
        "nixbld24"
        "nixbld25"
        "nixbld26"
        "nixbld27"
        "nixbld28"
        "nixbld29"
        "nixbld30"
        "nixbld31"
        "nixbld32"
      ];
    };
  };

  # temporary files
  systemd.tmpfiles.rules = [
    "d /var/lib/ly 0755 root root -"
  ];
}