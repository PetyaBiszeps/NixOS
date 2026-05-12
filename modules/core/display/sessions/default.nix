# Display sessions collection module
# Provides available graphical session modules
# Be careful when adding or removing modules, as it may affect desktop startup

{ config, lib, ... }:
  let defaultSession = config.variables.defaultSession or "niri";
in {
  imports = 
    lib.optionals (defaultSession == "niri") [
      ./niri.nix
    ];
}
