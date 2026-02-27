# NVF theme configuration
# Provides UI theme settings
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.nvf.settings.vim.theme = {
    name = "catppuccin";
    style = "mocha";
    enable = true;
  };
}