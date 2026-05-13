# Niri Keybinds module
# Provides complete niri binding
# Feel free to add, remove and modify anything here

{ lib, variables, ... }:
  let
    ide = variables.IDE or "zed";
    browser = variables.browser or "firefox";
    terminal = variables.terminal or "ghostty";
    fileManager = variables.fileManager or "nautilus";
    desktopShell = variables.desktopShell or "";
in {
  programs.niri.settings.binds = {
    "Mod+Q" = {
      hotkey-overlay.title = "Open Terminal: ${terminal}";
      action.spawn = terminal;
    };

    "Mod+B" = {
      hotkey-overlay.title = "Open Browser: ${browser}";
      action.spawn = browser;
    };

    "Mod+I" = {
      hotkey-overlay.title = "Open IDE: ${ide}";
      action.spawn = ide;
    };

    "Mod+E" = {
      hotkey-overlay.title = "Open Files";
      action.spawn = fileManager;
    };

    "Mod+Print" = {
      hotkey-overlay.title = "Screenshot Area Copy";
      action.spawn = ["sh" "-c" ''grim -g "$(slurp)" - | wl-copy''];
    };

    "Mod+Shift+Print" = {
      hotkey-overlay.title = "Screenshot Area Edit";
      action.spawn = ["sh" "-c" ''grim -g "$(slurp)" - | swappy -f -''];
    };

    "Mod+F" = {
      hotkey-overlay.title = "Maximize Column";
      action.maximize-column = [];
    };

    "Mod+Shift+F" = {
      hotkey-overlay.title = "Fullscreen Window";
      action.fullscreen-window = [];
    };

    "Mod+C" = {
      hotkey-overlay.title = "Close Window";
      action.close-window = [];
    };
  }
  // lib.optionalAttrs (desktopShell == "noctalia") {
    "Mod+R" = {
      hotkey-overlay.title = "Launcher";
      action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
    };
  };
}
