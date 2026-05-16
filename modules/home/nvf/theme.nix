# NVF theme module
# Provides UI theme settings

{ ... }: {
  programs.nvf.settings.vim.theme = {
    name = "catppuccin";
    style = "mocha";
    enable = true;
  };
}
