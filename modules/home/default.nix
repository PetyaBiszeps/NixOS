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

    ./git.nix
    ./xdg.nix
    ./zed.nix
    ./gtk.nix
    ./dev.nix
    ./apps.nix
    ./tmux.nix
    ./ghostty.nix
  ];
}
