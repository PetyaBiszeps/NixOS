# Zsh home config
# Provides zsh configuration
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}