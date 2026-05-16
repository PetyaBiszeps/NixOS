# Nix garbage collection module
# Provides automatic Nix cleanup through nh

{ ... }: {
  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    # flake = "/home/${config.variables.username}/nixos";
  };
}
