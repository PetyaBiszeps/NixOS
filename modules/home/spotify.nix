# Spotify home-manager module
# Provides spotify client config
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    spotatui
  ];
}
