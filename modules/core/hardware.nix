# Nix hardware module
# Provides hardware optimization
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libva libvdpau-va-gl libva-vdpau-driver libva-utils
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