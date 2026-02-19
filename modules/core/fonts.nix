# Nix fonts module
# Provides... fonts!
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      inter
      fira-code
      font-awesome
      dejavu_fonts
      jetbrains-mono
      material-icons
      fira-code-symbols
    ];
  };
}