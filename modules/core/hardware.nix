# Nix hardware module
# Provides hardware optimization
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    enableRedistributableFirmware = true;

    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
      disabledDefaultBackends = [ "escl" ];
    };
  };
  local.hardware-clock.enable = false;
}