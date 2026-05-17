# NVF Binds module
# Provides keybindings configuration for NVF

{ ... }: {
  programs.nvf.settings.vim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    maps.normal = {
      "-" = {
        action = "<cmd>Oil<CR>";
        desc = "Open parent directory";
      };

      # "<leader>e" = {
      #   action = "<cmd>Oil<CR>";
      #   desc = "Open Oil";
      # };

      "<leader>e" = {
        action = "<cmd>Oil --float<CR>";
        desc = "Open Oil float";
      };

      "<leader>d" = {
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        desc = "Show diagnostic";
      };

      "]d" = {
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        desc = "Next diagnostic";
      };

      "[d" = {
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        desc = "Previous diagnostic";
      };

      "<leader>q" = {
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        desc = "Diagnostics list";
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
