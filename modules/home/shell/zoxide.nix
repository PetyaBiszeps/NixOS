# Home manager zoxide
# Provides zoxide configuration

{ variables, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";
  };

  home.shellAliases = {
    e = "z";
  };
}
