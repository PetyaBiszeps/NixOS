# Oh My Posh home config
# Provides prompt configuration
# Feel free to add, remove and modify anything here

{ variables, pkgs, lib, ... }:
  let defaultShell = variables.defaultShell or "zsh";
in {
  home.packages = [pkgs.oh-my-posh];

  programs.zsh = lib.mkIf (defaultShell == "zsh") {
    enable = true;

    initExtra = ''
      eval "$(oh-my-posh init zsh --config "$HOME/.config/oh-my-posh/config.toml")"
    '';
  };

  programs.fish = lib.mkIf (defaultShell == "fish") {
    enable = true;

    interactiveShellInit = ''
      oh-my-posh init fish --config "$HOME/.config/oh-my-posh/config.toml" | source
    '';
  };

  xdg.configFile."oh-my-posh/config.toml".text = ''
    version = 2

    [[blocks]]
    type = "prompt"
    alignment = "left"

    [[blocks.segments]]
    type = "path"
    style = "plain"
    foreground = "#8aadf4"
    template = "{{ .Path }}"

    [[blocks.segments]]
    type = "git"
    style = "plain"
    foreground = "#a6da95"
    template = "{{ .HEAD }}{{ if .Working.Changed }}*{{ end }}"

    [[blocks]]
    type = "prompt"
    alignment = "right"

    [[blocks.segments]]
    type = "time"
    style = "plain"
    foreground = "#9da1a6"
    template = "{{ .CurrentDate | date \"15:04\" }}"
  '';
}