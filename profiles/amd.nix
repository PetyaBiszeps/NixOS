# AMD Default configuration file
# Enables AMD GPU support through the drivers module

{ ... }: {
  drivers.amdgpu = {
    enable = true;
  };
}
