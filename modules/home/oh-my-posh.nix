# Oh My Posh home config
# Provides prompt configuration
# Feel free to add, remove and modify anything here

{ variables, pkgs, lib, ... }:
  let
    theme = "jandedobbeleer";
    defaultShell = variables.defaultShell or "zsh";
    themeFile = "${pkgs.oh-my-posh}/share/oh-my-posh/themes/${theme}.omp.json";
in {
  home.packages = [pkgs.oh-my-posh];

  programs.zsh = lib.mkIf (defaultShell == "zsh") {
    enable = true;

    initContent = ''
      eval "$(oh-my-posh init zsh --config "$HOME/.config/oh-my-posh/${theme}.omp.json")"
    '';
  };

  programs.fish = lib.mkIf (defaultShell == "fish") {
    enable = true;

    interactiveShellInit = ''
      oh-my-posh init fish --config "$HOME/.config/oh-my-posh/${theme}.omp.json" | source
    '';
  };

  xdg.configFile."oh-my-posh/${theme}.omp.json".source = themeFile;
}