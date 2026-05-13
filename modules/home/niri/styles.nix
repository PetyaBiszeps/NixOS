# Niri styling
# Provides system style configuration file
# Rounded corners, subtle borders, and soft shadows

{ ... }: {
  programs.niri.settings = {
    # Let niri draw borders around windows that support server-side decorations.
    prefer-no-csd = true;

    layout = {
      # Default column width for apps
      default-column-width = {
        proportion = 0.5;
      };
      
      # Keep borders slim and calm.
      border = {
        enable = true;
        width = 2;
        active.color = "#7F8B9B";
        inactive.color = "#2B3036";
        urgent.color = "#B14D4D";
      };

      # Use border only, no extra focus ring.
      focus-ring.enable = false;

      # Soft shadow to separate windows from background.
      shadow = {
        enable = true;
        softness = 24;
        spread = 2;
        offset = {
          x = 0;
          y = 6;
        };
        color = "#00000066";
      };
    };

    window-rules = [
      # Apply rounded corners to all windows.
      {
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-right = 12.0;
          bottom-left = 12.0;
        };
        clip-to-geometry = true;
      }

      # Steam
      {
        matches = [
          { app-id = "steam"; }
        ];
        open-floating = true;
      }

      {
        matches = [
          {
            app-id = "steam";
            title = "^Steam$";
          }
        ];
        open-floating = false;
      }

      {
        matches = [
          {
            app-id = "steam";
            title = "^Steam Overlay$";
          }
        ];
        open-floating = false;
      }
    ];
  };
}
