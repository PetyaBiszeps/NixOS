# NVF LSP configuration
# Provides language server setup
# Feel free to add, remove and modify anything here

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
