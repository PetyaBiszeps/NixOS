# Oh My Posh home config
# Provides prompt configuration
# Feel free to add, remove and modify anything here

{ variables, pkgs, lib, ... }:
  let
    theme = "powerlevel10k_rainbow";
    defaultShell = variables.defaultShell or "zsh";
    themeFile = "${pkgs.oh-my-posh}/share/oh-my-posh/themes/${theme}.omp.json";
in {
  home.packages = [pkgs.oh-my-posh];

  home.activation.clearOhMyPoshCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf "$HOME/.cache/oh-my-posh"
  '';

  programs.zsh = lib.mkIf (defaultShell == "zsh") {
    enable = true;

    initContent = ''
      if command -v oh-my-posh >/dev/null 2>&1; then
        eval "$(oh-my-posh init zsh --config "$HOME/.config/oh-my-posh/${theme}.omp.json")"
      fi
    '';
  };

  programs.fish = lib.mkIf (defaultShell == "fish") {
    enable = true;

    interactiveShellInit = ''
      if type -q oh-my-posh
        oh-my-posh init fish --config "$HOME/.config/oh-my-posh/${theme}.omp.json" | source
      end
    '';
  };

  xdg.configFile."oh-my-posh/${theme}.omp.json".source = themeFile;
}
