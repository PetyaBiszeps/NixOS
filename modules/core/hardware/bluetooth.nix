# Hardware Bluetooth module
# Provides hardware bluetooth support
# Be careful modifying any of these, as they may break your bluetooth connection

{ ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
