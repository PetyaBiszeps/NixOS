# Security modules collection module
# Provides security-related system modules
# Be careful when adding or removing modules, as it may affect system permissions

{ ... }: {
  imports = [
    ./polkit.nix
  ];
}
