# JetBrains home packages
# Provides JetBrains tools install
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = [
    pkgs.jetbrains.webstorm
  ];
}