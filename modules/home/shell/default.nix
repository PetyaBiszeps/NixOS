# Shell modules collection module
# Provides shell configuration and shared shell environment
# Be careful when modifying this file, as it affects all shell sessions

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
