# Boot module
# Provides boot setup
# Feel free to add, remove and modify anything here

{ pkgs, config, ... }: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
    initrd.verbose = false;
    consoleLogLevel = 0;

    kernelParams = [
      "quiet"
      "loglevel=3"
      "rd.udev.log_level=3"
      "systemd.show_status=false"
      "amdgpu.ppfeaturemask=0xffffffff"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}