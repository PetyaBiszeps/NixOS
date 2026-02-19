# Time module
# Provides timezone configuration
# Feel free to add, remove and modify anything here

{ config, ... }: {
  time.timeZone = config.variables.timeZone or "UTC";
}