# modules/core/hardware/firmware.nix
# Enables redistributable firmware for hardware
# Be careful modifying this file, as it may break hardware support

{ ... }: {
  hardware = {
    enableRedistributableFirmware = true;
  };
}
