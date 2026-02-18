# Niri nix configuration file
# Provides control over this tilling window manager
# Can be modified and recreated however you want, feel free to test

{ pkgs, ... }: {
  programs.niri = {
    enable = true;

    settings = {
      layout.gaps = 10;
      
      input = {
        keyboard.layout = "us,ru,ua";
	keyboard.options = "grp:alt_shift_toggle";
      };

      binds = {
        "Mod+Enter".action.spawn = ["ghostty"];
	"Mod+Q".action.close-window = null;
	"Mod+Shift+Q".action.quit = null;
      };
    };
  };
}
