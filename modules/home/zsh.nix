# Zsh home config
# Provides zsh configuration
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nix-rebuild-all = "sudo nixos-rebuild switch --flake \"path:.#nixos\" --no-update-lock-file && sudo nix-collect-garbage -d";
    };
  };
}