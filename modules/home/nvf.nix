# NVF configuration
# Provides Nixvim version management
# Feel free to add, remove and modify anything here

{ inputs, pkgs, ... }: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      lsp = {
        enable = true;

        servers = {
          nixd = {
            enable = true;

            settings = {
              nixd = {
                autoArchive = true;
              };
            };
          };

          volar.enable = true;
          ts_ls.enable = true;
          gopls.enable = true;
          bashls.enable = true;
          pyright.enable = true;
        };
      };

      # Vim theme
      theme = {
        name = "catppuccin";
        style = "mocha";
        enable = true;
      };

      # Vim LSP's
      languages = {
        enableTreesitter = true;

        nix = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["nixd"];
        };

        ts = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["ts_ls"];
        };

        go = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["gopls"];
        };

        bash = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["bashls"];
        };

        python = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["pyright"];
        };
      };

      # Others
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };
}