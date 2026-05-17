# NVF Plugins alpha module
# Provides dashboard support via alpha

{ ... }: {
  programs.nvf.settings.vim.dashboard.alpha = {
    enable = true;
    theme = "dashboard";
  };
}
