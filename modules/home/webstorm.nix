# WebStorm home package
# Installs JetBrains WebStorm
# Feel free to add, remove and modify anything here

{ pkgs, ... }:
{
  home.packages = [
    pkgs.jetbrains.webstorm-bin
  ];
}