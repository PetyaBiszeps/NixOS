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
      # Required for GPU tuning via LACT, including overclocking / undervolting
      "amdgpu.ppfeaturemask=0xffffffff"
    ];
    services.xserver.videoDrivers = [ "amdgpu" ];

    systemd.tmpfiles.rules = [
      "L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages.clr}"
    ];

    environment.sessionVariables = {
      # RADV_DEBUG = "nodcc"; -> Uncomment only if needed as a workaround for RADV rendering artifacts or crashes
      RADV_PERFTEST = "gpl"; # -> useful for reducing shader stutter in some games
      AMD_VULKAN_ICD = "RADV";
      VDPAU_DRIVER = "radeonsi";
      LIBVA_DRIVER_NAME = "radeonsi";
    };
  };
}
