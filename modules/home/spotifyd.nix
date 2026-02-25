# Spotifyd home-manager module
# Provides spotifyd package and optional config
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    spotifyd
  ];

  xdg.configFile."spotifyd/spotifyd.conf".text = ''
    [global]
    device_name = "nixos"
    backend = "pipewire"
    volume_controller = "softvol"
    bitrate = 320
  '';
}