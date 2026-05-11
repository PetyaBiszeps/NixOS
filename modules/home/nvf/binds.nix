# NVF Binds module
# Provides keybindings configuration for NVF
# Be careful modifying this file, as it may break your NVF bindings

{ ... }: {
  programs.nvf.settings.vim.binds.whichKey = {
    enable = true;

    setupOpts = {
      preset = "modern";
      win.border = "rounded";
    };
  };
}
