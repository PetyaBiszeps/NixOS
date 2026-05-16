# Home manager fzf
# Provides fzf configuration

{ variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  programs.fzf = {
    enable = true;
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";
  };
}
