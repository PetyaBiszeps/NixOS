# NVF languages configuration
# Provides language-specific settings
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.nvf.settings.vim.languages = {
    enableTreesitter = true;
    
    nix = {
      enable = true;
      lsp.enable = true;
      lsp.servers = [ "nixd" ];
    };
    html.enable = true;
    css.enable = true;
    markdown.enable = true;

    typescript = {
      enable = true;
      lsp.enable = true;
      lsp.servers = [ "typescript-go" ];
    };

    go = {
      enable = true;
      lsp.enable = true;
      lsp.servers = [ "gopls" ];
    };

    python = {
      enable = true;
      lsp.enable = true;
      lsp.servers = [ "pyright" ];
    };

    bash = {
      enable = true;
      lsp.enable = true;
      lsp.servers = [ "bash-language-server" ];
    };
  };
}
