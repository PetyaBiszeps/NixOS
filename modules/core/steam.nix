# Steam module
# Provides steam full support
# Important module for gaming, feel free to change, but be careful

{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall = false;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];

      # Enable steam input for controller support
      package = pkgs.steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            # Controller support libraries
            libusb1
            udev
            SDL2

            # Additional libraries for better compatibility
            libxcursor
            libxi
            libxinerama
            libxscrnsaver
            libxcomposite
            libxdamage
            libxrender
            libxext

            # Fix for Xwayland symbol errors
            libkrb5
            keyutils
          ];
      };
    };
  };

  # Additional steam pkgs
  environment.systemPackages = with pkgs; [
    mangohud
  ];
}