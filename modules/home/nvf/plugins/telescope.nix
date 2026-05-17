# NVF Plugins telescope module
# Provides fuzzy finding, file search, live grep, and picker UI

{ ... }: {
  programs.nvf.settings.vim.telescope = {
    enable = true;
  };
}
