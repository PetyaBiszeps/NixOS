# LACT module
# Provides GPU monitoring and control service
# Feel free to add, remove and modify anything here

{ ... }: {
  services.lact = {
    enable = true;
  };
}
