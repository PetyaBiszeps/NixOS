# NVF plugins configuration
# Provides extra plugins for NVF
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  programs.nvf.settings.vim.extraPlugins = with pkgs.vimPlugins; {
    snacks = {
      package = snacks-nvim;
      setup = ''
        require("snacks").setup({})
      '';
    };
    opencode = {
      package = opencode-nvim;
    };
  };
}
