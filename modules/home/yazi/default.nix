# Yazi global file
# Provides import of modules
# Feel free to add, remove and change anything here

{ ... }:
  let
    theme = import ./theme.nix;
    keymap = import ./keymap.nix;
    settings = import ./yazi.nix;
in {
  programs.yazi = {
    enable = true;

    # Modules
    theme = theme;
    keymap = keymap;
    settings = settings;

    # Shell
    shellWrapperName = "yy";
    enableZshIntegration = defaultShell == "zsh";
    enableFishIntegration = defaultShell == "fish";

    # Plugins
    plugins = {
      git = pkgs.yaziPlugins.git;
      full-border = pkgs.yaziPlugins.full-border;
      smart-enter = pkgs.yaziPlugins.smart-enter;
    };

    # Lua
    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
      require("smart-enter"):setup {
        open_multi = true,
      }
    '';
  };
}