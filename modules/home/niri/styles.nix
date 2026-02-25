# Niri styling
# Rounded corners, subtle borders, and soft shadows

{ ... }: ''
  // Let niri draw borders around windows that support server-side decorations.
  prefer-no-csd

  layout {
    // Keep borders slim and calm.
    border {
      width 2
      active-color "#9aa4b2"
      inactive-color "#3a4048"
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

  // Steam
  window-rule {
    match app-id="steam"

    open-floating true
  }

  window-rule {
    match app-id="steam" title="^Steam$"

    open-floating false
  }
''
