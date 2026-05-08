# User shell module
# Provides user shell configuration
# Feel free to add, remove and modify anything here

{ config, lib, pkgs, ... }:
  let
    vars = config.variables;

    username = vars.username or "";
    defaultShell = vars.defaultShell or "zsh";

    hasUser = username != "" && username != null;
    shellPackage = if defaultShell == "fish" then pkgs.fish else pkgs.zsh;
in lib.mkIf hasUser {
  programs.zsh.enable = true;
  programs.fish.enable = true;

  users.users.${username}.shell = shellPackage;
}
