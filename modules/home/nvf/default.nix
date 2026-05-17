# NVF default.nix module
# Provides modular aggregator for NVF

{ inputs, pkgs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./plugins

    ./lsp.nix
    ./oil.nix
    ./binds.nix
    ./theme.nix
    ./health.nix
    ./languages.nix
    ./filetypes.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;
      
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };

  home.packages = with pkgs; [
    lsof
    tree-sitter
  ];
}
