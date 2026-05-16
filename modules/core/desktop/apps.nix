# Desktop system apps module
# Provides desktop system apps installation

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nautilus
    ffmpegthumbnailer
  ];
}
