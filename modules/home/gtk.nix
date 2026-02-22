# GTK home config
# Provides GTK config
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  gtk = {
    iconTheme = {
      name = "Tela-purple-dark";
      package = pkgs.tela-icon-theme;
    };
  };
}