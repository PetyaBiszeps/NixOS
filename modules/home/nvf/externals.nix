# NVF External tools module
# Provides external, needed tools for neovim

{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Treesitter
    tree-sitter

    # Opencode.nvim
    lsof

    # Snacks picker / explorer / tools
    sqlite
    trash-cli
    
    # Snacks image / PDF / LaTeX / Mermaid rendering
    imagemagick
    ghostscript
    tectonic
    mermaid-cli
  ];
}
