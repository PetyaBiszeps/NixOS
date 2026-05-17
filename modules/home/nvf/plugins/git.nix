# NVF Plugins git module
# Provides Git signs, hunk actions, blame, and inline diff support

{ ... }: {
  programs.nvf.settings.vim.git.gitsigns = {
    enable = true;
  };
}
