# Zsh home config
# Provides zsh configuration
# Feel free to add, remove and modify anything here

{ ... }: {
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Aliases
    shellAliases = {
      nixos-rebuild-all = "sudo nixos-rebuild switch --flake \"path:.#nixos\" --no-write-lock-file && sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d";
      nixos-delete-old = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d";
    };

    # Extra
    initContent = "fastfetch";
  };
}