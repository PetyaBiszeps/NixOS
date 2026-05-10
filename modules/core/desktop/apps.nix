# Desktop system apps module
# Provides desktop system apps support
# Be careful when modifying this module, as it may break your desktop functionality

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nautilus
    ffmpegthumbnailer
  ];
}
