# NVF languages configuration
# Provides language-specific settings and Treesitter parsers
# Be careful modifying this file, as it may break Neovim setup

{ pkgs, ... }: {
  programs.nvf.settings.vim = {
    languages = {
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

      # Extra
      vue.enable = true;
      tex.enable = true;
      scss.enable = true;
      typst.enable = true;
      svelte.enable = true;

      # Not available as NVF language modules
      # norg.enable = true;
      # regex.enable = true;
    };

    # Extra raw Treesitter grammars used by Snacks
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      # norg
      regex
    ];
  };
}
