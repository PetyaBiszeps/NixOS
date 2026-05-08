# Display sessions collection module
# Provides available graphical session modules
# Be careful when adding or removing modules, as it may affect desktop startup

{ ... }: {
  imports = [
    ./niri.nix
  ];
}
