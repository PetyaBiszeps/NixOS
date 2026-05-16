# Hardware printing module
# Provides hardware printing support

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
