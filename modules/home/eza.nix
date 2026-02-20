# eza home config
# Provides eza configuration
# Feel free to add, remove and modify anything here

{ variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  programs.eza = {
    enable = true;
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";
  };
}