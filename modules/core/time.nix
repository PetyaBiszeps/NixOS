# Time module
# Provides timezone and hardware clock configuration

{ config, ... }: {
  time = {
    timeZone = config.variables.timeZone or "UTC";
    hardwareClockInLocalTime = false;
  };
}
