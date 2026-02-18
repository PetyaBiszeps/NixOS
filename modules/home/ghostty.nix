# Nix Ghostty config
#
#

{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
  };
  home.file."./.config/ghostty/config".text = ''
        #theme = Aura
  '';
}