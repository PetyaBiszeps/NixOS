# Web development support module
# Provides node tooling for web workflows
# Feel free to add, remove and modify anything here

{ lib, pkgs, variables, ... }:
  let webSupportEnable = variables.webSupportEnable or false;
in lib.mkIf webSupportEnable {
  home.packages = with pkgs; [
    nodejs_24
    opencode
    yarn
    pnpm
    lazygit
  ];
}
