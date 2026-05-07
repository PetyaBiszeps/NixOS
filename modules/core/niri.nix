# Niri system configuration
# Enables the Niri session and makes it available to the display manager
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  services = {
    displayManager = {
      defaultSession = "niri";
      sessionPackages = [ pkgs.niri ];
    };
  };
}
