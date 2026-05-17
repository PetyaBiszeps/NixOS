# NVF Binds module
# Provides keybindings configuration for NVF

{ ... }: {
  programs.nvf.settings.vim = {
    globals = {
      mapLeader = " ";
      maplocalleader = " ";
    };

    maps.normal = {
      "-" = {
        action = "<cmd>Oil<CR>";
        desc = "Open parent directory";
      };

      "<leader>e" = {
        action = "<cmd>Oil<CR>";
        desc = "Open Oil";
      };

      "<leader>E" = {
        action = "<cmd>Oil --float<CR>";
        desc = "Open Oil float";
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
