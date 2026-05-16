# Hardware firmware module
# Enables redistributable firmware for hardware

{ ... }: {
  hardware = {
    enableRedistributableFirmware = true;
  };
}
