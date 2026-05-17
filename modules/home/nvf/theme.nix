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
      mini-icons = {
        package = mini-icons;
  
        setup = ''
          require("mini.icons").setup({})
        '';
      };
    };
  };
}
