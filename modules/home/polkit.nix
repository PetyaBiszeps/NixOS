# Home manager Polkit
# Provides user session Polkit authentication agent

{ ... }: {
  services.polkit-gnome = {
    enable = true;
  };
}
