# Hardware Graphics module
# Provides hardware graphics support
# Be careful modifying any of these, as they may break your graphics setup

{ pkgs, ... }: {
  hardware.graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        libva
        libvdpau-va-gl
        libva-vdpau-driver
        libva-utils
      ];
    };
}
