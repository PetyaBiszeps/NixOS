# NixOS development configuration module file
# Created by YP00, so we have clean development configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };
  services.openssh.enable = true;
}
