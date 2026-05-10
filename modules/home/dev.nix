# Web development support module
# Provides node tooling for web workflows
# Feel free to add, remove and modify anything here

{ lib, pkgs, variables, ... }:
  let devSupportEnable = variables.devSupportEnable or false;
in lib.mkIf devSupportEnable {
  home.packages = with pkgs; [
    # Search / navigation
    fd
    tree
    ripgrep
    
    # Git-related
    gh
    lazygit
    pre-commit

    # AI-related
    opencode

    # Package managers
    pnpm
    yarn

    # Data / config processing
    jq
    yq-go

    # JS / TS
    nodejs
    typescript
    typescript-language-server

    # Python
    python3
    uv
    ruff
    pyright

    # Go
    go
    gopls
    delve
    # gotools -> confict with gopls
    golangci-lint

    # Virtualization
    docker-compose
  ];
}
