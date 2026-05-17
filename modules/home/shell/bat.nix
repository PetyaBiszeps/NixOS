# Home manager bat
# Provides bat configuration

{ pkgs, lib, ... }: {
  programs.bat = {
    enable = true;

    config = {
      style = "plain";
      pager = "less -FR";
      theme = lib.mkForce "Catppuccin";
    };

    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batdiff
      prettybat
    ];
  };

  home = {
    shellAliases = {
      cat = "bat";
    };

    sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
    };
  };
}
