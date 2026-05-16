# Hardware scanning module
# Provides hardware scanning support

{ pkgs, ... }: {
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
    disabledDefaultBackends = [ "escl" ];
  };
}
