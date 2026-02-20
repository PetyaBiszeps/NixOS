# Home modules import
# Placeholder for home-manager module list
# Feel free to add, remove and modify anything here

{ variables, lib, ... }:
  let vars = variables;
in {
  imports = [
    ./niri
    ./zsh.nix
    ./fzf.nix
    ./eza.nix
    ./zoxide.nix
    ./fd.nix
    ./rg.nix
    ./bat.nix
    ./zed.nix
    ./ghostty.nix
    ./noctalia.nix
    ./oh-my-posh.nix
  ];
}
