# Docker virtualisation module
# Provides Docker daemon support for development workflows

{ config, lib, ... }:
  let
    vars = config.variables;

    username = vars.username;
    hasUser = username != "" && username != null;
    devSupportEnable = vars.devSupportEnable or false;
in lib.mkIf (devSupportEnable && hasUser) {
  virtualisation.docker = {
    enable = true;

    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
