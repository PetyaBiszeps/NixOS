# Polkit agent configuration
# Provides user session Polkit authentication agent
# Feel free to modify it, but be careful, since it can break some modal windows

{ ... }: {
  services.polkit-gnome = {
    enable = true;
  };
}
