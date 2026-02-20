# Zsh home config
# Provides zsh configuration
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nixos-rebuild-all = "sudo nixos-rebuild switch --flake \"path:.#nixos\" --no-write-lock-file && sudo nix-collect-garbage -d";
      nixos-delete-old = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake \"path:.#nixos\" --no-write-lock-file";
    };
  };
}