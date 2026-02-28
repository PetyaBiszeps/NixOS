# Niri styling
# Rounded corners, subtle borders, and soft shadows

{ ... }: ''
  // Let niri draw borders around windows that support server-side decorations.
  prefer-no-csd

  layout {
    // Keep borders slim and calm.
    border {
      width 2
      active-color "#7f8b9b"
      inactive-color "#2b3036"
      urgent-color "#b14d4d"
    }

    // Use border only, no extra focus ring.
    focus-ring {
      off
    }

    // Soft shadow to separate windows from background.
    shadow {
      on
      softness 24
      spread 2
      offset x=0 y=6
      color "#00000066"
    }
  }

  // Apply rounded corners to all windows.
  window-rule {
    geometry-corner-radius 12
    clip-to-geometry true
  }

  // Steam popups float
  window-rule {
    match app-id="steamwebhelper"
    open-floating true
  }
''