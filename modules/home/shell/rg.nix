# Home manager ripgrep
# Provides ripgrep configuration

{ ... }: {
  programs.ripgrep = {
    enable = true;
  };

  home.shellAliases = {
    grep = "rg";
  };
}
