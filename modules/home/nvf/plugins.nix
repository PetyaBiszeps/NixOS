# NVF plugins module
# Provides extra plugins for NVF

{ pkgs, ... }: {
  programs.nvf.settings.vim.extraPlugins = with pkgs.vimPlugins; {
    devicons = {
      package = nvim-web-devicons;

      setup = ''
        require("nvim-web-devicons").setup({})
      '';
    };

    mini-icons = {
      package = mini-icons;

      setup = ''
        require("mini.icons").setup({})
      '';
    };
  };
}
