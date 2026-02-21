# AMD drivers file
# Provides drivers for AMD GPUs
# Feel free to add, remove and modify anything here

{ lib, pkgs, config, ... }: with lib;
  let cfg = config.drivers.amdgpu;
in {
  options.drivers.amdgpu = {
    enable = mkEnableOption "Enable AMD Drivers";
    overdrive.enable = true;
  };

  config = mkIf cfg.enable {
    systemd.tmpfiles.rules = ["L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"];
    services.xserver.videoDrivers = ["amdgpu"];

    environment.sessionVariables = {
      RADV_DEBUG = "nodcc";
      RADV_PERFTEST = "gpl";
      AMD_VULKAN_ICD = "RADV";
      VDPAU_DRIVER = "radeonsi";
      LIBVA_DRIVER_NAME = "radeonsi";
    };
  };
}