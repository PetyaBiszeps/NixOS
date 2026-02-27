# NVF configuration
# Provides Nixvim version management
# Feel free to add, remove and modify anything here

{ inputs, pkgs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./lsp.nix
    ./theme.nix
    ./languages.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      # Globals
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;

      # Extra
      extraPlugins = with pkgs.vimPlugins; {
        snacks = {
          package = snacks-nvim;
          setup = ''
            require("snacks").setup({})
          '';
        };
      };
    };
  };
}