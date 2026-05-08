# Ghostty home config
# Provides ghostty configuration
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    settings = {
      theme = "dark:Catppuccin Mocha,light:Catppuccin Latte";

      font-family = "Fira Code";
      font-size = 14;

      background-opacity = 0.95;
      background-blur-radius = 60;
      mouse-hide-while-typing = true;

      keybind = [
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
      ];
      window-save-state = "always";
      gtk-single-instance = true;
      confirm-close-surface = false;
    };
  };
}
