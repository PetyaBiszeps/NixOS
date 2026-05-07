# Gaming controllers module
# Provides gamepad and controller support
# Be careful when adding or removing modules, as it may affect the system's gaming

{ config, lib, ... }:
  let gamingSupportEnable = config.variables.gamingSupportEnable or false;
in
lib.mkIf gamingSupportEnable {
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
    steam-hardware.enable = true; # Enable Steam hardware udev rules (includes controller support)
    xpadneo.enable = true; # Enable xpadneo for better Xbox controller support (especially for wireless)
  };
}
