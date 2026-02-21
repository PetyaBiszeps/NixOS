# NVF configuration
# Provides Nixvim version management
# Feel free to add, remove and modify anything here

{ pkgs, lib, ... }: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      # Vim theme
      theme = {
        name = "gruvbox";
        style = "dark";
        enable = true;
      };

      # Vim LSP
      languages = {
        enableLSP = true;
        enableTreesitter = true;

        ts.enable = true;
        nix.enable = true;
      };

      # Others
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };
}