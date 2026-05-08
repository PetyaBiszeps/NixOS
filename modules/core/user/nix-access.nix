# Nix user access module
# Provides Nix daemon access for the configured user
# Feel free to add, remove and modify anything here

{ config, lib, ... }:
  let
    username = config.variables.username or "";
    hasUser = username != "" && username != null;
in lib.mkIf hasUser {
  nix.settings.allowed-users = [
    username
  ];
}
