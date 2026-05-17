# NVF default.nix module
# Provides modular aggregator for NVF

{ inputs, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./lsp.nix
    ./binds.nix
    ./theme.nix
    ./health.nix
    ./plugins.nix
    ./languages.nix
    ./externals.nix
    ./filetypes.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      # Globals
      dashboard.alpha = {
        enable = true;
        theme = "dashboard";
      };
      notify.nvim-notify = {
        enable = true;

        setupOpts = {
          render = "compact";
          stages = "fade_in_slide_out";
          timeout = 2000;
          position = "top_right";
        };
      };
      ui.noice = {
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
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };
}
