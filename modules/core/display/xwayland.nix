# Xwayland module
# Provides Xwayland support for legacy X11 applications
# Be careful modifying this module, as it affects system stability for X11 applications

{ ... }: {
  programs.xwayland = {
    enable = true;
  };
}
