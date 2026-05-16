# Hardware graphics module
# Provides hardware graphics support

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
