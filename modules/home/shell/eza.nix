# Home manager eza
# Provides eza configuration

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
    ll = "eza -lh --no-user --long";
    la = "eza -lah --no-user --long";
    lt = "eza --tree --level=2";
    tree = "eza --tree";
  };
}
