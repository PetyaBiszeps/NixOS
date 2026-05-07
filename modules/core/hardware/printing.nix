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

    ipp-usb.enable = printEnable;
  };
}
