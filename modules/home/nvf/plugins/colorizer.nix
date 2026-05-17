# NVF Plugins colorizer module
# Provides inline color previews for hex, rgb, hsl, CSS variables, and Tailwind colors

{ ... }: {
  programs.nvf.settings.vim.ui.nvim-highlight-colors = {
    enable = true;

    setupOpts = {
      render = "background";
      enable_tailwind = true;
    };
  };
}
