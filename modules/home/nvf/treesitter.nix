# NVF Treesitter module
# Provides extra language modules / parsers used by Snacks
# Be careful modifying this file, as it may break Neovim snacks

{ ... }: {
  programs.nvf.settings.vim.languages = {
    vue.enable = true;
    tex.enable = true;
    scss.enable = true;
    # norg.enable = true;
    typst.enable = true;
    # regex.enable = true;
    svelte.enable = true;
  };
}
