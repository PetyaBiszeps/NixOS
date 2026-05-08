# Desktop modules collection module
# Provides desktop infrastructure modules
# Be careful modifying this module, as it affects system applications stability

{ ... }: {
  imports = [
    ./portal.nix
    ./services.nix
  ];
}
