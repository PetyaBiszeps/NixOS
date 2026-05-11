# NVF configuration
# Provides Nixvim version management
# Feel free to add, remove and modify anything here

{ inputs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./lsp.nix
    ./theme.nix
    ./plugins.nix
    ./languages.nix
    ./externals.nix
    ./filetypes.nix
    ./treesitter.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      # Globals
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };
}
