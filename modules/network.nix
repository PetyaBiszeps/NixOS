# NixOS network configuration module file
# Created by YP00, so we have clean network configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  networking.hostName = "templateHost";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;  
}
