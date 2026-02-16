# NixOS network configuration module file
# Created by YP00, so we have clean network configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  networking.hostName = "HOME-PC";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [];
    allowedTCPPorts = [3000 5173 8000 8080];
  };
}
