# Desktop services module
# Provides desktop service integrations

{ config, lib, ... }:
  let defaultSession = config.variables.defaultSession or "";
in {
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
    # blueman.enable = true; -> Bluetooth GUI
  }
  // lib.optionalAttrs (defaultSession != "niri") {
    gnome.gnome-keyring.enable = true;
  };
}
