# Hardware bluetooth module
# Provides hardware bluetooth support

{ ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
