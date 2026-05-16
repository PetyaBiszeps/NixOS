# User default.nix module
# Provides modular aggregator for user account and Home Manager modules

{ ... }: {
  imports = [
    ./shell.nix
    ./account.nix
    ./nix-access.nix
    ./home-manager.nix
  ];
}
