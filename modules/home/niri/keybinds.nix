# Niri Keybinds module
# Provides complete niri binding
# Feel free to add, remove and modify anything here

{ terminal, browser, ... }: ''
  binds {
    Mod+Q hotkey-overlay-title="Open Terminal: ${terminal}" { spawn "${terminal}"; }
    Mod+B hotkey-overlay-title="Open Browser: ${browser}" { spawn "${browser}"; }
    Mod+C hotkey-overlay-title="Close Window" { close-window; }
  }
''