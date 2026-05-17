# NVF theme module
# Provides UI theme settings

{ pkgs, ... }: {
  programs.nvf.settings.vim = {
    theme = {
      name = "catppuccin";
      style = "mocha";
      enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; {
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
  };
}
