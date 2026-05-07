# Nix settings module
# Provides general Nix daemon and store settings
# Be careful when modifying this file, as it may affect your Nix settings

{ ... }: {
  nix.settings = {
    auto-rollback = true;
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
}
