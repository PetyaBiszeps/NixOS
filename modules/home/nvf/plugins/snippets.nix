# NVF Plugins snippets module
# Provides snippet engine and bundled snippets for completion

{ ... }: {
  programs.nvf.settings.vim.snippets.luasnip = {
    enable = true;
  };
}
