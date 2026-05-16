# Shell default.nix module
# Provides modular aggregator for shell configuration and shared shell environment

{ ... }: {
  imports = [
    ./rg.nix
    ./fd.nix
    ./bat.nix
    ./eza.nix
    ./fzf.nix
    ./zsh.nix
    ./zoxide.nix
    ./oh-my-posh.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
