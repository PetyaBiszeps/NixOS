# Tmux home config
# Provides tmux configuration
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";

    mouse = true;
    clock24 = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 100000;

    extraConfig = ''
    '';
  };
}