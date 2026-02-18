# Nix home global configuration file
# It imports all /home modules into system
# You can create new modules and edit existing ones and then import them with this file

{ inputs, host, lib, ... }: {
  imports = [
    ./niri
    ./fastfetch
    ./ghostty.nix
  ];
}