# Services module
# Provides useful service collection setup
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  # Services to start
  services = {
    gvfs.enable = true;
    dbus.enable = true;
    upower.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    libinput.enable = true;

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  # XDG portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}