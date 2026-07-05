# Boot module
# Provides boot setup

{ pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot = {
        enable = false;
        configurationLimit = 5;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    plymouth = {
      enable = true;

      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
      theme = "nixos-bgrt";
    };
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
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
