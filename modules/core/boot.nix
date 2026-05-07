# Boot module
# Provides boot setup
# Be careful when modifying anything here, as it may break your system startup

{ pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    initrd.verbose = false;
    consoleLogLevel = 0;

    kernelParams = [
      "quiet"
      "splash"
      
      "loglevel=3"
      "udev.log_level=3"
      "rd.udev.log_level=3"
      
      # "systemd.show_status=auto"
      # "rd.systemd.show_status=auto"
    ];
    kernelPackages = pkgs.linuxPackages;
  };
}
