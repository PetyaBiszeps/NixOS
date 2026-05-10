# Docker virtualisation module
# Provides Docker daemon support for development workflows
# Be careful: users in the docker group effectively have root-level access

{ config, lib, ... }:
  let
    vars = config.variables;

    username = vars.username;
    devSupportEnable = vars.devSupportEnable or false;
in lib.mkIf devSupportEnable {
  virtualisation.docker = {
    enable = true;

    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
