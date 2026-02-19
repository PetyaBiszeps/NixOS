# Gaming support module
# Provides various tools and settings to upgrade gaming experience
# Feel free to add, remove and modify anything here

{ config, lib, pkgs, ... }:
  let gamingSupportEnable = config.variables.gamingSupportEnable or false;
in lib.mkIf gamingSupportEnable {
  # Enable kernel modules for controller support
  boot.kernelModules = [
    "xpad"
    "uinput"
    "hid_nintendo"
  ];

  # Enable joystick support in the kernel
  boot.kernelParams = [
    "usbhid.quirks=0x057e:0x2009:0x80000000" # Fix for Switch Pro Controller
  ];

  # Hardware configuration for controller support
  hardware = {
    # Enable Steam hardware udev rules (includes controller support)
    steam-hardware.enable = true;

    # Enable xpadneo for better Xbox controller support (especially for wireless)
    xpadneo.enable = true;
  };

  # System packages for gaming support
  environment.systemPackages = with pkgs; [
    # Gaming tools
    gamescope
    protonup-qt

    # SDL
    SDL2

    # Controller mapping tool
    antimicrox
  ];
}