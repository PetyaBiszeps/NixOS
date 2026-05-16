# Shell default.nix module
# Provides modular aggregator for shell configuration and shared shell environment

{ ... }: {
  imports = [
    ./zsh.nix
    ./oh-my-posh.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
