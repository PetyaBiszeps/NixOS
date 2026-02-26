# Home modules import
# Placeholder for home-manager module list
# Feel free to add, remove and modify anything here

{ variables, lib, ... }:
  let vars = variables;
in {
  imports = [
    ./niri
    ./fastfetch

    ./fd.nix
    ./rg.nix
    ./zsh.nix
    ./nvf.nix
    ./fzf.nix
    ./eza.nix
    ./bat.nix
    ./xdg.nix
    ./zed.nix
    ./gtk.nix
    ./tmux.nix
    ./polkit.nix
    ./zoxide.nix
    ./ghostty.nix
    ./spotify.nix
    ./noctalia.nix
    ./spotifyd.nix
    ./jetbrains.nix
    ./oh-my-posh.nix
  ];
}