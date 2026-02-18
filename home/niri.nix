# Niri nix configuration file
# Provides control over this tilling window manager
# Can be modified and recreated however you want, feel free to test

{ pkgs, ... }: {
  programs.niri = {
    settings = {
      layout.gaps = 10;
      
      input = {
        keyboard.layout = "us,ru,uk";
      };
    };
  };
}
