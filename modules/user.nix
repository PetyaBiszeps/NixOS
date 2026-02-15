# NixOS user configuration module file
# Created by YP00, so we have clean user configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  services.userborn.enable = true;
  xdg.portal = {
     enable = true;
     extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  users.users.templateUser = {
     isNormalUser = true;
     description = "templateUser";
     extraGroups = ["networkmanager" "wheel"];
     hashedPassword = "templatePasswordHash";
     packages = with pkgs; [];
  };
  systemd.user.services.create-xdg-user-dirs = {
     description = "Create User Directories";
     wantedBy = ["default.target"];
     serviceConfig.Type = "oneshot";
     script = "${pkgs.xdg-user-dirs}/bin/xdg-user-dirs-update";
  };
}
