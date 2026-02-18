# Nix global configuration file
#
#

{ pkgs, ... }: {
  # Imports
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efiTouchEfiVariables = true;

  # Network
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # GUI (Niri)
  programs.niri.enable = true;

  # Timezone
  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";

  # User
  users.users.yp00 = {
   isNormalUser = true;
   extraGroups = ["video" "networkmanager" "wheel"];
  };

  # NixOS current version (Don't remove that unless you know what you do)
  system.stateVersion = "25.11";
}
