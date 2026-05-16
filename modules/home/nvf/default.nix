# NVF default.nix module
# Provides modular aggregator for NVF

{ inputs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./lsp.nix
    ./binds.nix
    ./theme.nix
    ./plugins.nix
    ./languages.nix
    ./externals.nix
    ./filetypes.nix
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
