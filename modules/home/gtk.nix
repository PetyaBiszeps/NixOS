# Home manager GTK
# Provides GTK config

{ pkgs, ... }: {
  home.packages = with pkgs; [
    adwaita-icon-theme     # Fallback
  ];

  gtk = {
    iconTheme = {
      name = "Tela-purple-dark";
      package = pkgs.tela-icon-theme;
    };
  };
}
