# Niri Keybinds module
# Provides complete niri binding
# Feel free to add, remove and modify anything here

{ terminal, browser, ide, desktopShell, ... }:
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
    Mod+E hotkey-overlay-title="Open Files" { spawn "nautilus"; }
    Mod+Print hotkey-overlay-title="Screenshot Area" { spawn "sh" "-c" "grim -g \"$(slurp)\" - | wl-copy"; }
    Mod+C hotkey-overlay-title="Close Window" { close-window; }
  }
''