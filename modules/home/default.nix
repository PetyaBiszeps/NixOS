# Home global import file
# Provides import of all /home modules

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
