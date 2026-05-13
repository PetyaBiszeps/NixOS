# Niri session packages
# Provides extra tools used by the Niri session
# Feel free to add, remove and modify anything here

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
