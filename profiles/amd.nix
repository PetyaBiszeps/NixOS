# AMD Default configuration file
# Enables AMD GPU support through the drivers module
# Feel free to add, remove, modify and fix anything here

{ ... }: {
  # Enable GPU drivers
  drivers.amdgpu.enable = true;
}
