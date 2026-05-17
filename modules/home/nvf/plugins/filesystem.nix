# NVF Plugins Oil module
# Provides filesystem navigation, browsing, and editing via Oil

{ ... }: {
  programs.nvf.settings.vim.utility.oil-nvim = {
    enable = true;

    setupOpts = {
      delete_to_trash = true;
      watch_for_changes = true;
      default_file_explorer = true;
      skip_confirm_for_simple_edits = true;

      columns = [ "icon" ];

      view_options = {
        sort = [
          [ "type" "asc" ]
          [ "name" "asc" ]
        ];
        show_hidden = true;
        natural_order = "fast";
      };

      float = {
        border = "rounded";
        padding = 2;
        max_width = 0.9;
        max_height = 0.9;
      };
    };

    gitStatus.enable = true;
  };
}
