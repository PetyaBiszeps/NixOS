# Web development support module
# Provides node tooling for web workflows
# Feel free to add, remove and modify anything here

{ config, lib, pkgs, ... }:
  let webSupportEnable = config.variables.webSupportEnable or false;
in lib.mkIf webSupportEnable {
  programs.nix-ld = {
    enable = true;
    # libraries = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    nodejs_24
    opencode
    yarn
    pnpm
    
    nil
    nixd
    lazygit
    nixpkgs-fmt
  ];
}
