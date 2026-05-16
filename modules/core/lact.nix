# LACT module
# Provides GPU monitoring and control service

{ ... }: {
  services.lact = {
    enable = true;
  };
}
