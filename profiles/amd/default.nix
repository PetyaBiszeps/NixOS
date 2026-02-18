# AMD default profile
# Hardware configuration made for AMD GPUs
#

{ host, ... }: {
  imports = [
    ../../hosts/${host}
    ../../modules/drivers
    ../../modules/core
  ];

  # Enable GPU Drivers
  drivers.amdgpu.enable = true;
  drivers.intel.enable = false;
  drivers.nvidia.enable = false;
  vm.guest-services.enable = false;
  drivers.nvidia-prime.enable = false;
}