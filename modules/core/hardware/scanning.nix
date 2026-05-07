# Hardware scanning module
# Provides hardware scanning support
# Be careful modifying this module, as it may break scanning functionality

{ pkgs, ... }: {
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
    disabledDefaultBackends = [ "escl" ];
  };
}
