# Shell atuin module
# Provides atuin integration

{ variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  programs.atuin = {
    enable = true;
    
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";

    settings = {
      # 
    };
  };
}
