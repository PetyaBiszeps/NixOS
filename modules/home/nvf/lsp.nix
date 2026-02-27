# NVF LSP configuration
# Provides language server setup
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.nvf.settings.vim.lsp = {
    enable = true;
    lspconfig.enable = true;

    servers = {
      nixd = {
        enable = true;

        settings = {
          nixd = {
            autoArchive = true;
          };
        };
      };

      vtsls.enable = true;
      gopls.enable = true;
      pyright.enable = true;
      bash_ls.enable = true;
    };
  };
}