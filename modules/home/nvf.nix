# NVF configuration
# Provides Nixvim version management
# Feel free to add, remove and modify anything here

{ inputs, pkgs, ... }: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      lsp.enable = true;

      # Vim theme
      theme = {
        name = "catppuccin";
        style = "mocha";
        enable = true;
      };

      # Vim LSP's
      languages = {
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
