# Brave home-manager module
# Provides Brave browser installation
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = with pkgs; [
    brave
  ];
}