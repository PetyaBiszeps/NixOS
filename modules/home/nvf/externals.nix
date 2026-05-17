# NVF External tools module
# Provides external, needed tools for neovim

{ pkgs, ... }: {
  home.packages = with pkgs; [
    lsof
    tree-sitter
  ];
}
