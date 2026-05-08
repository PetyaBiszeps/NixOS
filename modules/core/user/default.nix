# User modules collection module
# Provides user account and Home Manager modules
# Be careful modifying this module, as it affects user access

{ ... }: {
  imports = [
    ./shell.nix
    ./account.nix
    ./nix-access.nix
    ./home-manager.nix
  ];
}
