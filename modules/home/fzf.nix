# fzf home config
# Provides fzf configuration
# Feel free to add, remove and modify anything here

{ lib, variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  programs.fzf = {
    enable = true;
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";
  };
}