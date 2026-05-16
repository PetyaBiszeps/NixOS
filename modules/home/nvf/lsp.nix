# NVF LSP module
# Provides language server setup

{ ... }: {
  programs.nvf.settings.vim.lsp = {
    enable = true;
    lspconfig.enable = true;

    servers = {
      nixd.settings = {
        nixd = {
          autoArchive = true;
        };
      };
    };
  };
}
