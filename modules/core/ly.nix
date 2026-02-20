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
      animation = "matrix";
      hide_system_users = true;
      save_file = "/var/lib/ly/save";
      # hide_borders = true;
      # min_refresh_delta = 5;
    };
  };

  # temporary files
  systemd.tmpfiles.rules = [
    "d /var/lib/ly 0755 root root -"
  ];
}