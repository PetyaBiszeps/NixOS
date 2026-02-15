# Global NixOS configuration file
# Modified by YP00, so we have clean configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ config, pkgs, ... }:

{
  imports = [./hardware-configuration.nix];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # User
  users.users.yp00 = {
     isNormalUser = true;
     description = "Yaroslav";
     extraGroups = ["networkmanager" "wheel"];
     packages = with pkgs; [];
  };

  # Hyprland (Desktop Environment)
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  # Nautilus
  services.gvfs.enable = true; # -> Trashbox

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
     nerd-fonts.fira-code
     nerd-fonts.symbols-only
  ];

  # Network
  networking.hostName = "HOME-PC";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # Set your time zone, i18n properties
  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Package list
  environment.systemPackages = with pkgs; [
     wget
     git gh
     grim slurp wl-clipboard
     pulsemixer
     ghostty gcc
     nautilus
     neovim
     brave

     gnumake
     unzip
  ];

  # Development
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };
  services.openssh.enable = true;

  # NixOS current version (Don't remove that unless you know what you do)
  system.stateVersion = "25.11";
}
