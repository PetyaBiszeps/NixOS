# Ghostty home config
# Provides ghostty configuration
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
  };

  xdg.configFile."ghostty/config".text = ''
    font-family = Fira Code
    font-size = 14
  '';
}