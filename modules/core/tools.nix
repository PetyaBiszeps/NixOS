# Tools core module
# Provides system tools support, like git, wget, etc.
# Feel free to add more tools here, be careful with deleting, since it can be useful for many cases

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
  ];
}
