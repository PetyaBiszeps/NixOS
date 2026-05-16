# NVF Binds module
# Provides keybindings configuration for NVF

{ ... }: {
  programs.nvf.settings.vim.binds.whichKey = {
    enable = true;

    setupOpts = {
      preset = "modern";
      win.border = "rounded";
    };
  };
}
