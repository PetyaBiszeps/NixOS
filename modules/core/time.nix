# Time module
# Provides timezone and hardware clock configuration
# Feel free to add, remove and modify anything here, but can break time synchronization

{ config, ... }: {
  time = {
    timeZone = config.variables.timeZone or "UTC";
    hardwareClockInLocalTime = false;
  };
}
