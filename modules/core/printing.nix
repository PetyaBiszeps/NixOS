# Nix Printing module
# Provides printing support
# Feel free to add, remove and modify anything here

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