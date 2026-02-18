#
#
#

{ config, lib, pkgs, host, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) enableExtraBrowsers;
in {
  config = lib.mkIf enableExtraBrowsers {
    environment.systemPackages = with pkgs; [
      brave
      firefox
      google-chrome
    ];
  };
}