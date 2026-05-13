# AMD drivers file
# Provides driver options for AMD GPUs
# Be careful when editing this file, it controls AMD GPU drivers

{ config, lib, pkgs, ... }:
  let cfg = config.drivers.amdgpu;
in {
  options.drivers.amdgpu = {
    enable = lib.mkEnableOption "Enable AMD Drivers";
  };

  config = lib.mkIf cfg.enable {
    hardware = {
      amdgpu.opencl.enable = true;
      amdgpu.overdrive.enable = true;
    };

    boot.kernelParams = [
      "amdgpu.ppfeaturemask=0xffffffff"
    ];
    services.xserver.videoDrivers = [ "amdgpu" ];

    systemd.tmpfiles.rules = [
      "L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages.clr}"
    ];

    environment.sessionVariables = {
      RADV_DEBUG = "nodcc";
      RADV_PERFTEST = "gpl";
      AMD_VULKAN_ICD = "RADV";
      VDPAU_DRIVER = "radeonsi";
      LIBVA_DRIVER_NAME = "radeonsi";
    };
  };
}
