# Home modules import
# Placeholder for home-manager module list
# Feel free to add, remove and modify anything here

{ ... }: {
  imports = [
    ./nvf
    ./niri
    ./yazi
    ./shell
    ./fastfetch
    ./quickshell

    ./fd.nix
    ./rg.nix
    ./git.nix
    ./fzf.nix
    ./eza.nix
    ./bat.nix
    ./xdg.nix
    ./zed.nix
    ./gtk.nix
    ./dev.nix
    ./apps.nix
    ./tmux.nix
    # ./polkit.nix -> Created by default in Niri-flake
    ./zoxide.nix
    ./ghostty.nix
  ];
}
