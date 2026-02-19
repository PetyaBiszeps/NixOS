# Niri Keybinds module
# Provides complete niri binding
# Feel free to add, remove and modify anything here

{ terminal, browser, ide, ... }: ''
  binds {
    Mod+Q hotkey-overlay-title="Open Terminal: ${terminal}" { spawn "${terminal}"; }
    Mod+B hotkey-overlay-title="Open Browser: ${browser}" { spawn "${browser}"; }
    Mod+I hotkey-overlay-title="Open IDE: ${ide}" { spawn "${ide}"; }
    Mod+C hotkey-overlay-title="Close Window" { close-window; }
  }
''