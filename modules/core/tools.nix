# Tools core module
# Provides system tools support, like wget, curl, etc.

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    unzip
  ];
}
