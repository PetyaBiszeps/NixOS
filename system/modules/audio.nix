# NixOS audio configuration module file
# Created by YP00, so we have clean audio configuration to start with
# Everything can be changed and modified, the structure is pretend to be skeleton of your (!) config

{ pkgs, ... }: {
  security.rtkit.enable = true;

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    jack.enable = true;
    pulse.enable = true;
  };
}
