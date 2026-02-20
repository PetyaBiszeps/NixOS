# Home modules import
# Placeholder for home-manager module list
# Feel free to add, remove and modify anything here

{ variables, lib, ... }:
  let vars = variables;
in {
  imports = [
    ./niri
    ./fd.nix
    ./rg.nix
    ./zsh.nix
    ./fzf.nix
    ./eza.nix
    ./bat.nix
    ./zed.nix
    ./zoxide.nix
    ./ghostty.nix
    ./noctalia.nix
    ./oh-my-posh.nix
  ];
}