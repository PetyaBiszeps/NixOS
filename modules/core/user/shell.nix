# User shell module
# Provides user shell configuration

{ config, lib, pkgs, ... }:
  let
    vars = config.variables;

    username = vars.username or "";
    defaultShell = vars.defaultShell or "zsh";

    hasUser = username != "" && username != null;
    shellPackage = if defaultShell == "fish" then pkgs.fish else pkgs.zsh;
in lib.mkIf hasUser {
  programs.zsh.enable = defaultShell == "zsh";
  programs.fish.enable = defaultShell == "fish";

  users.users.${username}.shell = shellPackage;
}
