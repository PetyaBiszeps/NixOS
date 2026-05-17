# NVF Plugins alpha module
# Provides dashboard support via alpha

{ ... }: {
  programs.nvf.settings.vim.dashboard.alpha = {
    enable = true;
    theme = null;

    layout = [
      {
        type = "padding";
        val = 10;
      }

      {
        type = "text";
        val = [
          "    ____       __              ____  _                           "
          "   / __ \\___  / /___  ______ _/ __ )(_)________  ___  ____  _____"
          "  / /_/ / _ \\/ __/ / / / __ `/ __  / / ___/_  / / _ \\/ __ \\/ ___/"
          " / ____/  __/ /_/ /_/ / /_/ / /_/ / (__  ) / /_/  __/ /_/ (__  ) "
          "/_/    \\___/\\__/\\__, /\\__,_/_____/_/____/ /___/\\___/ .___/____/  "
          "               /____/                             /_/            "
        ];
        opts = {
          position = "center";
          hl = "AlphaHeader";
        };
      }

      {
        type = "padding";
        val = 3;
      }

      {
        type = "group";
        val = [
          {
            type = "button";
            val = "  New file";
            on_press.__raw = ''
              function()
                vim.cmd("ene")
                vim.cmd("startinsert")
              end
            '';
            opts = {
              position = "center";
              shortcut = "E";
              align_shortcut = "right";
              hl_shortcut = "AlphaShortcut";
              width = 56;
              cursor = 3;
            };
          }

          {
            type = "button";
            val = "  Find file";
            on_press.__raw = ''
              function()
                vim.cmd("Telescope find_files")
              end
            '';
            opts = {
              position = "center";
              shortcut = "Space + F + F";
              align_shortcut = "right";
              hl_shortcut = "AlphaShortcut";
              width = 56;
              cursor = 3;
            };
          }

          {
            type = "button";
            val = "  Recently opened files";
            on_press.__raw = ''
              function()
                vim.cmd("Telescope oldfiles")
              end
            '';
            opts = {
              position = "center";
              shortcut = "Space + F + H";
              align_shortcut = "right";
              hl_shortcut = "AlphaShortcut";
              width = 56;
              cursor = 3;
            };
          }

          {
            type = "button";
            val = "  Frecency/MRU";
            on_press.__raw = ''
              function()
                vim.cmd("Telescope oldfiles")
              end
            '';
            opts = {
              position = "center";
              shortcut = "Space + F + R";
              align_shortcut = "right";
              hl_shortcut = "AlphaShortcut";
              width = 56;
              cursor = 3;
            };
          }

          {
            type = "button";
            val = "  Find word";
            on_press.__raw = ''
              function()
                vim.cmd("Telescope live_grep")
              end
            '';
            opts = {
              position = "center";
              shortcut = "Space + F + G";
              align_shortcut = "right";
              hl_shortcut = "AlphaShortcut";
              width = 56;
              cursor = 3;
            };
          }

          {
            type = "button";
            val = "  Jump to bookmarks";
            on_press.__raw = ''
              function()
                vim.cmd("Telescope marks")
              end
            '';
            opts = {
              position = "center";
              shortcut = "Space + F + M";
              align_shortcut = "right";
              hl_shortcut = "AlphaShortcut";
              width = 56;
              cursor = 3;
            };
          }

          {
            type = "button";
            val = "󰁯  Open last session";
            on_press.__raw = ''
              function()
                vim.cmd("SessionRestore")
              end
            '';
            opts = {
              position = "center";
              shortcut = "Space + S + L";
              align_shortcut = "right";
              hl_shortcut = "AlphaShortcut";
              width = 56;
              cursor = 3;
            };
          }
        ];
        opts = {
          spacing = 1;
        };
      }
    ];
  };
}
