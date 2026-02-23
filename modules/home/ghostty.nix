# Ghostty home config
# Provides ghostty configuration
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
  };

  xdg.configFile."ghostty/config".text = ''
    font-family = "Fira Code"
    font-size = 14

    theme = dark:Catppuccin Mocha,light:Catppuccin Latte
    background-opacity = 0.95
    window-save-state = always
    gtk-single-instance = true
    background-blur-radius = 60
    mouse-hide-while-typing = true
  '';
}