# Nix hardware module
# Provides hardware optimization
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libvdpau-va-gl libva-vdpau-driver
      ];
    };
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    enableRedistributableFirmware = true;

    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
      disabledDefaultBackends = [ "escl" ];
    };
  };
  time.hardwareClockInLocalTime = false;
}