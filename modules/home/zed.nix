# Home manager Zed
# Provides Zed editor install

{ pkgs, ... }: {
  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile."zed/settings.json".text = builtins.toJSON {
    auto_install_extensions = {
      nix = true;
      vue = true;
      html = true;
      scss = true;
      sql = true;
      graphql = true;
      dockerfile = true;
      git-firefly = true;
      docker-compose = true;
      charmed-icons = true;
      jetbrains-themes = true;
    };

    theme = {
      mode = "dark";
      light = "JetBrains Light";
      dark = "JetBrains Dark";
    };

    icon_theme = {
      mode = "dark";
      light = "Warm Charmed Icons";
      dark = "Warm Charmed Icons";
    };

    theme_overrides = {
      "JetBrains Dark" = {
        background = "#111111";
        border = "#111111";
        "border.variant" = "#111111";
        "element.hover" = "#1A1A1A";
        "element.active" = "#222222";
        "element.selected" = "#222222";
        "tab_bar.background" = "#111111";
        "tab.active_background" = "#111111";
        "tab.inactive_background" = "#111111";
        "panel.background" = "#111111";
        "editor.background" = "#111111";
        "toolbar.background" = "#111111";
        "title_bar.background" = "#111111";
        "status_bar.background" = "#111111";
        "editor.gutter.background" = "#111111";
        "editor.document_highlight.read_background" = "#BD9DFF44";
        "editor.document_highlight.write_background" = "#BD9DFF66";
      };

      "JetBrains Light" = {
        background = "#F7F8FA";
        border = "#F7F8FA";
        "border.variant" = "#F7F8FA";
        "element.hover" = "#E8E9ED";
        "element.active" = "#DFE1E5";
        "element.selected" = "#DFE1E5";
        "tab_bar.background" = "#F7F8FA";
        "tab.active_background" = "#F7F8FA";
        "tab.inactive_background" = "#F7F8FA";
        "panel.background" = "#F7F8FA";
        "editor.background" = "#F7F8FA";
        "toolbar.background" = "#F7F8FA";
        "title_bar.background" = "#F7F8FA";
        "status_bar.background" = "#F7F8FA";
        "editor.gutter.background" = "#F7F8FA";
        "editor.document_highlight.read_background" = "#D7E3FF";
        "editor.document_highlight.write_background" = "#C9D9FF";
      };
    };

    title_bar = {
      show_onboarding_banner = true;
      show_project_items = true;
      show_branch_name = true;
      show_user_menu = true;
    };

    tab_bar = {
      show = true;
    };

    toolbar = {
      breadcrumbs = false;
      quick_actions = false;
    };

    status_bar = {
      "experimental.show" = true;
    };

    project_panel = {
      dock = "right";
      scrollbar = {
        show = "never";
      };
      hide_root = false;
      default_width = 250;
      indent_guides = {
        show = "never";
      };
    };

    autosave = {
      after_delay = {
        milliseconds = 1000;
      };
    };

    scrollbar = {
      show = "never";
    };

    gutter = {
      min_line_number_digits = 0;
      folds = false;
      runnables = false;
    };

    inlay_hints = {
      enabled = true;
      show_type_hints = true;
      show_parameter_hints = true;
    };

    indent_guides = {
      enabled = false;
    };

    agent = {
      button = false;
    };

    collaboration_panel = {
      button = false;
    };

    outline_panel = {
      button = false;
    };

    terminal = {
      font_family = "JetBrainsMono Nerd Font";
      copy_on_select = true;
    };

    lsp = {
      nil = {
        settings = {
          nil = {
            nix = {
              flake = {
                autoArchive = true;
              };
            };
          };
        };
      };
    };

    vim_mode = false;
    formatter = "none";
    auto_update = false;
    base_keymap = "JetBrains";
    ui_font_size = 16;
    format_on_save = "on";
    buffer_font_size = 15.0;
    buffer_font_weight = 400.0;
    code_actions_on_format = {
      "source.fixAll.eslint" = true;
    };
    restore_on_startup = "launchpad";
    extend_comment_on_newline = false;
  };
}
