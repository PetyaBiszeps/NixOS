# NixOS user configuration module file
# Created by YP00, so we have clean user configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  users.users.yp00 = {
    isNormalUser = true;
    description = "yp00";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };
}
