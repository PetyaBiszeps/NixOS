# eza home config
# Provides eza configuration
# Feel free to add, remove and modify anything here

{ variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  programs.eza = {
    enable = true;

    git = true;
    icons = "auto";
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";
  };

  home.shellAliases = {
    ls = "eza";
    lt = "eza --tree --level=2";
    ll = "eza -lh --no-user --long";
    la = "eza -lah";
    tree = "eza --tree";
  };
}