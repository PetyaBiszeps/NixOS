# zoxide home config
# Provides zoxide configuration
# Feel free to add, remove and modify anything here

{ variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";
  };
}