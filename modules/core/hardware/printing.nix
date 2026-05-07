# Hardware Printing module
# Provides hardware printing support
# Be careful modifying this module, as it may break printing functionality

{ config, ... }:
  let printEnable = config.variables.printEnable or false;
in {
  services = {
    printing = {
      enable = printEnable;
      drivers = [
        # pkgs.hplipWithPlugin
      ];
    };

    avahi = {
      enable = printEnable;
      nssmdns4 = true;
      openFirewall = true;
    };

    ipp-usb.enable = printEnable;
  };
}
