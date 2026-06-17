# Noctalia shell module
# Provides modular aggregator for Noctalia shell

{ lib, inputs, variables, ... }:
  let desktopShell = variables.desktopShell or "none";
in {
  imports = [
    ./settings
    
    inputs.noctalia.homeModules.default
  ];

  config = lib.mkIf (desktopShell == "noctalia") {
    programs.noctalia = {
      enable = true;
      systemd.enable = false;
    };
  };
}
