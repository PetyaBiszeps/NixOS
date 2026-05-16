# Xwayland module
# Provides Xwayland support for legacy X11 applications

{ ... }: {
  programs.xwayland = {
    enable = true;
  };
}
