# AMD Default configuration file
# Provides utility collection profile for AMD GPUs
# Feel free to add, remove, modify and fix anything here

{ ... }: {
  # Enable GPU drivers
  drivers.amdgpu.enable = true;
}