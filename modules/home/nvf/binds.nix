# NVF Binds module
# Provides keybindings configuration for NVF

{ ... }: {
  programs.nvf.settings.vim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    maps = {
      normal = {
        "-" = {
          action = "<cmd>Oil<CR>";
          desc = "Open parent directory";
        };

        "<leader>e" = {
          action = "<cmd>Oil --float<CR>";
          desc = "Open Oil float";
        };

        "<leader>dd" = {
          action = "<cmd>lua vim.diagnostic.open_float()<CR>";
          desc = "Show diagnostic";
        };

        "<leader>dq" = {
          action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
          desc = "Diagnostics list";
        };

        "]d" = {
          action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
          desc = "Next diagnostic";
        };

        "[d" = {
          action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
          desc = "Previous diagnostic";
        };

        "<C-d>" = {
          action = "<C-d>zz";
          desc = "Scroll down and center";
        };

        "<C-u>" = {
          action = "<C-u>zz";
          desc = "Scroll up and center";
        };

        "<leader>y" = {
          action = ''"+y'';
          desc = "Yank to system clipboard";
        };

        "<leader>Y" = {
          action = ''"+yy'';
          desc = "Yank line to system clipboard";
        };

        "<leader>D" = {
          action = ''"+d'';
          desc = "Delete to system clipboard";
        };
      };

      visual = {
        "<leader>y" = {
          action = ''"+y'';
          desc = "Yank to system clipboard";
        };

        "<leader>D" = {
          action = ''"+d'';
          desc = "Delete to system clipboard";
        };
      };
    };

    binds.whichKey = {
      enable = true;

      setupOpts = {
        preset = "modern";
        win.border = "rounded";
      };
    };
  };
}
