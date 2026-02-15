# NixOS fonts configuration module file
# Created by YP00, so we have clean fonts configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];  
}
