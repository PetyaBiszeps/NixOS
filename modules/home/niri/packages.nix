# Niri session packages module
# Provides extra tools used by the Niri session

{ pkgs, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
    swappy
    cliphist
    wl-clipboard
    xwayland-satellite
  ];
}
