# NVF Plugins notify module
# Provides notification support via nvim-notify

{ ... }: {
  programs.nvf.settings.vim.notify.nvim-notify = {
    enable = true;

    setupOpts = {
      render = "compact";
      stages = "fade_in_slide_out";
      timeout = 2000;
      position = "top_right";
    };
  };
}
