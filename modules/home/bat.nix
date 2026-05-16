# Home manager bat
# Provides bat configuration

{ pkgs, lib, ... }: {
  programs.bat = {
    enable = true;

    config = {
      style = "full";
      pager = "less -FR";
      theme = lib.mkForce "Catppuccin";
    };

    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
    ];
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
