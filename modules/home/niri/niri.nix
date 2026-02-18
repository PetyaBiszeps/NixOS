# Niri Core configuration file
#
#

{ host, config, pkgs, lib, ... }: {
  # Install Niri and related packages
  home.packages = with pkgs; [
    niri
    grim
    slurp
    swappy
    wl-clipboard
  ];

  # Generate niri config.kdl
  xdg.configFile."niri/config.kdl".text = ''
        environment {}
  '';
}