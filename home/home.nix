# Home.nix user configuration file
# 
#

{ pkgs, inputs, ... }: {
  home = {
    username = "yp00";
    homeDirectory = "/home/yp00";
    stateVersion = "23.11";
  };

  # Import
  imports = [ inputs.niri.homeModules.niri ];

  # Config
  programs.home-manager = {
    enable = true;
  };

  programs.niri = {
    enable = true;

    settings = {
      spawn-at-startup = [{
        command = [];
      }];
    };
  };
}
