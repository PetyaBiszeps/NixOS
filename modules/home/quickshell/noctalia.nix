# Noctalia shell module
# Provides Noctalia shell configuration
# Feel free to add, remove and modify anything here

{ lib, inputs, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in lib.mkIf (desktopShell == "noctalia") {
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = false;
  };
}
