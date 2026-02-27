# NVF languages configuration
# Provides language-specific settings
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.nvf.settings.vim.languages = {
    enableTreesitter = true;

    nix = {
      enable = true;
      lsp.enable = true;
      lsp.servers = ["nixd"];
    };

    ts = {
      enable = true;
      lsp.enable = true;
      lsp.servers = ["ts_ls"];
    };

    go = {
      enable = true;
      lsp.enable = true;
      lsp.servers = ["gopls"];
    };

    python = {
      enable = true;
      lsp.enable = true;
      lsp.servers = ["pyright"];
    };

    bash = {
      enable = true;
      lsp.enable = true;
      lsp.servers = ["bash-ls"];
    };
  };
}