# Spotify + Spicetify home-manager module
# Provides spotify client and spicetify CLI
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    spicetify-cli
  ];
}