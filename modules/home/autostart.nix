# Autostart home module
# Provides user session autostart applications
# Feel free to add, remove and modify anything here

{ ... }: {
  xdg.configFile = {
    "autostart/telegram.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Telegram
      Exec=telegram-desktop
      Terminal=false
      X-GNOME-Autostart-enabled=true
    '';

    "autostart/discord.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Discord
      Exec=discord
      Terminal=false
      X-GNOME-Autostart-enabled=true
    '';

    "autostart/steam.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Steam
      Exec=steam
      Terminal=false
      X-GNOME-Autostart-enabled=true
    '';
    };
}
