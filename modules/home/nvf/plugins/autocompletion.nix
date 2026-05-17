# NVF Plugins completion module
# Provides completion engine for LSP, snippets, buffers, paths, and commands

{ ... }: {
  programs.nvf.settings.vim.autocomplete.nvim-cmp = {
    enable = true;
  };
}
