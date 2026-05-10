# Desktop modules collection module
# Provides desktop infrastructure modules
# Be careful modifying this module, as it affects system applications stability

{ ... }: {
  imports = [
    ./apps.nix
    ./portal.nix
    ./services.nix
  ];
}
