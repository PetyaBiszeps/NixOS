# Niri Keybinds module
# Provides complete niri binding
# Feel free to add, remove and modify anything here

{ ide, browser, terminal, fileManager, desktopShell, ... }:
  let
    launcherBind = if desktopShell == "noctalia" then ''
      Mod+R hotkey-overlay-title="Launcher" { spawn "noctalia-shell" "ipc" "call" "launcher" "toggle"; }
    '' else "";
in ''
  binds {
    ${launcherBind}

    Mod+Q hotkey-overlay-title="Open Terminal: ${terminal}" { spawn "${terminal}"; }
    Mod+B hotkey-overlay-title="Open Browser: ${browser}" { spawn "${browser}"; }
    Mod+I hotkey-overlay-title="Open IDE: ${ide}" { spawn "${ide}"; }
    Mod+E hotkey-overlay-title="Open Files" { spawn "${fileManager}"; }
    Mod+Print hotkey-overlay-title="Screenshot Area Copy" { spawn "sh" "-c" "grim -g \"$(slurp)\" - | wl-copy"; }
    Mod+Shift+Print hotkey-overlay-title="Screenshot Area Edit" { spawn "sh" "-c" "grim -g \"$(slurp)\" - | swappy -f -"; }
    Mod+F hotkey-overlay-title="Maximize Column" { maximize-column; }
    Mod+Shift+F hotkey-overlay-title="Fullscreen Window" { fullscreen-window; }
    Mod+C hotkey-overlay-title="Close Window" { close-window; }
  }
''
