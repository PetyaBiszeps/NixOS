# Nix host packages configuration
# Provides file to install specific packages
# Feel free to add, remove and modify anything there

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Add host-specific packages here
  ];
}