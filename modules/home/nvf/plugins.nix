# NVF plugins configuration
# Provides extra plugins for NVF
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  programs.nvf.settings.vim.extraPlugins = with pkgs.vimPlugins; {
    snacks = {
      package = snacks-nvim;
      
      setup = ''
        require("snacks").setup({
          input = {
            enabled = true,
          },
          picker = {
            enabled = true,
          },
          notifier = {
            enabled = true,
          },
          explorer = {
            enabled = true,
          },
          image = {
            enabled = true,
          },
          lazygit = {
            enabled = true,
          },
          terminal = {
            enabled = true,
          },
          bigfile = {
            enabled = true,
          },
          quickfile = {
            enabled = true,
          },
          words = {
            enabled = true,
          },
        })
      '';
    };

    opencode = {
      package = opencode-nvim;
      
      setup = ''
        vim.g.opencode_opts = {
          -- This can be configured later if needed.
        }
      '';
    };

    devicons = {
      package = nvim-web-devicons;

      setup = ''
        require("nvim-web-devicons").setup({})
      '';
    };

    mini-icons = {
      package = mini-icons;

      setup = ''
        require("mini.icons").setup({})
      '';
    };
  };
}
