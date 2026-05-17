# NVF Plugins completion module
# Provides completion engine for LSP, snippets, buffers, paths, and commands

{ ... }: {
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    enable = true;

    setupOpts = {
      signature = {
        enable = true;
      };
      keymap.preset = "super-tab";

      completion = {
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 200;
        };
        menu.auto_show = true;
      };

      sources.default = [
        "lsp"
        "path"
        "buffer"
        "snippets"
      ];

      fuzzy = {
        implementation = "prefer_rust";

        sorts = [
          "exact"
          "score"
          "sort_text"
        ];
        prebuilt_binaries.download = false;
      };
    };
  };
}
