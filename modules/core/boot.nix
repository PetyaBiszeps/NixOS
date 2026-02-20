# Boot module
# Provides boot setup
# Feel free to add, remove and modify anything here

{ pkgs, config, ... }: {
  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    loader.timeout = 0;
    initrd.verbose = false;
    consoleLogLevel = 0;
    loader.efi.canTouchEfiVariables = true;

    kernelParams = [
      "quiet"
      "loglevel=3"
      "rd.udev.log_level=3"
      "systemd.show_status=false"
    ];
  };
}