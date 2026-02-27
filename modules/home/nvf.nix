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
          gopls.enable = true;
          bashls.enable = true;
          pyright.enable = true;
          tsserver.enable = true;
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

        vue = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["volar"];
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

        ts = {
          enable = true;
          lsp.enable = true;
          lsp.servers = ["tsserver"];
        };
      };

      # Others
      telescope.enable = true;
      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };
}