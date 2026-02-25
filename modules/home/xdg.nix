# XDG user dirs configuration
# Provides default XDG user directories
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = [pkgs.xdg-user-dirs];

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;

      # List of directories
      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      publicShare = "$HOME/Public";
      templates = "$HOME/Templates";
      videos = "$HOME/Videos";
    };
  };
}