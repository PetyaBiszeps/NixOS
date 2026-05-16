# Web development support module
# Provides node tooling for web workflows

{ lib, pkgs, variables, ... }:
  let devSupportEnable = variables.devSupportEnable or false;
in lib.mkIf devSupportEnable {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  
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
    # gotools -> conflict with gopls
    golangci-lint

    # Rust
    rustup

    # Virtualization
    docker-compose
  ];
}
