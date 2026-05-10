# Tools core module
# Provides system tools support, like wget, curl, etc.
# Feel free to add more tools here, be careful with deleting, since it can be useful for many cases

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    unzip
  ];
}
