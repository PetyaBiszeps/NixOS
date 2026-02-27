# Home modules import
# Placeholder for home-manager module list
# Feel free to add, remove and modify anything here

{ variables, lib, ... }:
  let vars = variables;
in {
  imports = [
    ./nvf
    ./niri
    ./yazi
    ./fastfetch

    ./fd.nix
    ./rg.nix
    ./zsh.nix
    ./fzf.nix
    ./eza.nix
    ./bat.nix
    ./xdg.nix
    ./zed.nix
    ./gtk.nix
    ./tmux.nix
    ./brave.nix
    ./polkit.nix
    ./zoxide.nix
    ./ghostty.nix
    ./spotify.nix
    ./discord.nix
    ./noctalia.nix
    ./telegram.nix
    ./jetbrains.nix
    ./teamspeak.nix
    ./oh-my-posh.nix
  ];
}