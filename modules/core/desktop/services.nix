# Desktop services module
# Provides desktop integration services
# Be careful modifying this module, as it affects system behaviour

{ config, lib, ... }:
  let defaultSession = config.variables.defaultSession or "";
in {
  programs = {
    dconf.enable = true;
  };

  services = lib.mkIf (defaultSession != "niri") {
    gvfs.enable = true;
    dbus.enable = true;
    upower.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    libinput.enable = true;
    # blueman.enable = true; -> Bluetooth GUI
    gnome.gnome-keyring.enable = true;
  };
}
