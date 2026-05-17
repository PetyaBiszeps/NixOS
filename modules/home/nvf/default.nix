# NVF default.nix module
# Provides modular aggregator for NVF

{ inputs, pkgs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./plugins

    ./lsp.nix
    ./binds.nix
    ./theme.nix
    ./health.nix
    ./languages.nix
    ./filetypes.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;
    };
  };

  home.packages = with pkgs; [
    lsof
    tree-sitter
  ];
}
