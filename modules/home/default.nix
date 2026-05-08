# Home modules import
# Placeholder for home-manager module list
# Feel free to add, remove and modify anything here

{ ... }: {
  imports = [
    ./nvf
    ./niri
    ./yazi
    ./fastfetch
    ./quickshell

    ./fd.nix
    ./rg.nix
    ./zsh.nix
    ./fzf.nix
    ./eza.nix
    ./bat.nix
    ./xdg.nix
    ./zed.nix
    ./gtk.nix
    ./dev.nix
    ./apps.nix
    ./tmux.nix
    ./polkit.nix
    ./zoxide.nix
    ./ghostty.nix
    ./nautilus.nix
    ./oh-my-posh.nix
  ];
}
