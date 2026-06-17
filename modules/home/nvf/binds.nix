# NVF Binds module
# Provides keybindings configuration for NVF

{ ... }: {
  programs.nvf.settings.vim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<cmd>Oil<CR>";
        desc = "Open parent directory";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Oil --float<CR>";
        desc = "Open Oil float";
      }
      {
        mode = "n";
        key = "<leader>dd";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        desc = "Show diagnostic";
      }
      {
        mode = "n";
        key = "<leader>dq";
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        desc = "Diagnostics list";
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        desc = "Next diagnostic";
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        desc = "Previous diagnostic";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        desc = "Scroll down and center";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        desc = "Scroll up and center";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        desc = "Next search result centered";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        desc = "Previous search result centered";
      }
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<CR>";
        desc = "Save file";
      }
      {
        mode = "n";
        key = "<leader>/";
        action = "<cmd>nohlsearch<CR>";
        desc = "Clear search highlight";
      }
      {
        mode = "n";
        key = "<leader>y";
        action = ''"+y'';
        desc = "Yank to system clipboard";
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = ''"+yy'';
        desc = "Yank line to system clipboard";
      }
      {
        mode = "n";
        key = "<leader>D";
        action = ''"+d'';
        desc = "Delete to system clipboard";
      }

      {
        mode = "v";
        key = "<leader>y";
        action = ''"+y'';
        desc = "Yank to system clipboard";
      }
      {
        mode = "v";
        key = "<leader>D";
        action = ''"+d'';
        desc = "Delete to system clipboard";
      }
      {
        mode = "v";
        key = "<leader>p";
        action = ''"_dP'';
        desc = "Paste without replacing register";
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        desc = "Move selection down";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        desc = "Move selection up";
      }
    ];

    binds.whichKey = {
      enable = true;

      setupOpts = {
        preset = "modern";
        win.border = "rounded";
      };
    };
  };
}
