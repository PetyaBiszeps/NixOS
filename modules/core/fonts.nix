# Nix fonts module
# Provides... fonts!

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
      
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };
}
