# Home manager Zen
# Provides support for Zen Browser

{ inputs, ... }: {
  imports = [ inputs.zen-browser.homeModules.twilight-official ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
