# NVF Plugins alpha module
# Provides dashboard support via alpha

{ ... }: {
  programs.nvf.settings.vim = {
    dashboard.alpha = {
      enable = true;
      theme = "dashboard";
    };

    luaConfigRC.alpha-dashboard = ''
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "    ____       __              ____  _                           ",
        "   / __ \\___  / /___  ______ _/ __ )(_)________  ___  ____  _____",
        "  / /_/ / _ \\/ __/ / / / __ `/ __  / / ___/_  / / _ \\/ __ \\/ ___/",
        " / ____/  __/ /_/ /_/ / /_/ / /_/ / (__  ) / /_/  __/ /_/ (__  ) ",
        "/_/    \\___/\\__/\\__, /\\__,_/_____/_/____/ /___/\\___/ .___/____/  ",
        "               /____/                             /_/            ",
      }

      dashboard.section.header.opts = {
        position = "center",
        hl = "AlphaHeader",
      }

      local function button(key, label, command, shortcut)
        local item = dashboard.button(key, label, command)

        item.opts.position = "center"
        item.opts.shortcut = shortcut or key
        item.opts.align_shortcut = "right"
        item.opts.hl_shortcut = "AlphaShortcut"
        item.opts.width = 56
        item.opts.cursor = 3

        return item
      end

      dashboard.section.buttons.val = {
        button("e", "  New file", "<cmd>enew<CR>", "E"),
        button("f", "  Find file", "<cmd>echo 'Use keybinds faggot'<CR>", "Space + F + F"),
        button("h", "  Recently opened files", "<cmd>echo 'Use keybinds faggot'<CR>", "Space + F + H"),
        button("r", "  Frecency/MRU", "<cmd>echo 'Use keybinds faggot'<CR>", "Space + F + R"),
        button("g", "  Find word", "<cmd>echo 'Use keybinds faggot'<CR>", "Space + F + G"),
        button("m", "  Jump to bookmarks", "<cmd>echo 'Use keybinds faggot'<CR>", "Space + F + M"),
        button("s", "󰁯  Open last session", "<cmd>echo 'Use keybinds faggot'<CR>", "Space + S + L"),
      }

      dashboard.section.buttons.opts = {
        spacing = 1,
      }

      local function get_padding()
        local header_height = #dashboard.section.header.val
        local buttons_height = #dashboard.section.buttons.val * 2
        local gaps_height = 6
        local total_height = header_height + buttons_height + gaps_height
        local padding = math.floor((vim.o.lines - total_height) / 2)

        return padding > 0 and padding or 1
      end

      local vertical_padding = get_padding()

      dashboard.opts.layout = {
        { type = "padding", val = vertical_padding },
        dashboard.section.header,
        { type = "padding", val = 3 },
        dashboard.section.buttons,
        { type = "padding", val = vertical_padding },
      }

      alpha.setup(dashboard.opts)
    '';
  };
}
