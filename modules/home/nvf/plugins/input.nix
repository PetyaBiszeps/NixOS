# NVF Plugins noice module
# Provides cmd input adjustments

{ ... }: {
  programs.nvf.settings.vim.ui.noice = {
    enable = true;

    setupOpts = {
      presets = {
        bottom_search = true;
        lsp_doc_border = true;
        command_palette = true;
        long_message_to_split = true;
      };

      lsp = {
        signature = {
          enabled = true;
        };

        override = {
          "cmp.entry.get_documentation" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
        };
      };
    };
  };
}
