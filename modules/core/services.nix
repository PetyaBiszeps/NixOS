# Services module
# Provides useful service collection setup
# Feel free to add, remove and modify anything here

{ ... }: {
  # Services to start
  services = {
    gvfs.enable = true;
    upower.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    tumbler.enable = true;
    libinput.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}