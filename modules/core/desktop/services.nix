# Desktop services module
# Provides desktop integration services
# Be careful modifying this module, as it affects system behaviour

{ ... }: {
  programs = {
    dconf.enable = true;
  };

  services = {
    gvfs.enable = true;
    dbus.enable = true;
    upower.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    libinput.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}
