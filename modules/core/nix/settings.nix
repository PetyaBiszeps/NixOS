# Nix settings module
# Provides general Nix daemon and store settings

{ ... }: {
  nixpkgs.config.allowUnfree = true;
  
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
}
