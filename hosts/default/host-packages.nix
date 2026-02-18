# Nix host-packages configuration
# Provies file to make your specific packages
#

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Add host-specific packages here
  ];
}