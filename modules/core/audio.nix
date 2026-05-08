# Core audio module
# Provides audio services using PipeWire
# Be careful modifying this module, as it may break audio functionality

{ ... }: {
  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
  };

  security.rtkit.enable = true;
}
