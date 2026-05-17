# NVF Plugins statusline module
# Provides statusline UI with mode, file, git, diagnostics, and cursor info

{ ... }: {
  programs.nvf.settings.vim.statusline.lualine = {
    enable = true;
  };
}
