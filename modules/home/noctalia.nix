# Noctalia home-manager module
# Enables the Noctalia shell when selected via variables.desktopShell
# Feel free to add, remove and modify anything here

{ lib, inputs, variables, ... }:
  let enable = (variables.desktopShell or "") == "noctalia";
in {
  imports = lib.optional enable inputs.noctalia.homeModules.default;

  config = lib.mkIf enable {
    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;
    };
  };
}