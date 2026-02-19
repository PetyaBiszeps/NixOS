# Zed home package
# Provides Zed editor install
# Feel free to add, remove and modify anything here

{ pkgs, ... }: {
  home.packages = [
    pkgs.zed-editor
  ];
}