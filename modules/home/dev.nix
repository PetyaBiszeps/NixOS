# Web development support module
# Provides node tooling for web workflows
# Feel free to add, remove and modify anything here

{ lib, pkgs, variables, ... }:
  let webSupportEnable = variables.webSupportEnable or false;
in lib.mkIf webSupportEnable {
  home.packages = with pkgs; [
    # Git-related
    lazygit

    # AI-related
    opencode

    # Package managers
    pnpm
    yarn

    # JS / TS
    nodejs_24

    # Python
    python3Full
    uv
    ruff
    pyright

    # Go
    go
    gopls
    delve
    gotools
    golangci-lint
  ];
}
