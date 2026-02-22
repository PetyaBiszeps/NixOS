# Polkit agent configuration
# Provides user session polkit agent
# Feel free to add, remove and modify anything here

{ ... }: {
  services.polkit-gnome = {
    enable = true;
  };
}