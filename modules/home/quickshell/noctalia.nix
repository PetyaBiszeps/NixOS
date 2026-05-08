# Noctalia shell module
# Provides Noctalia shell configuration
# Feel free to add, remove and modify anything here

{ lib, inputs, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  imports = [ inputs.noctalia.homeModules.default ];

  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia-shell = {
      enable = true;
      systemd.enable = false;
    };
  };
}
