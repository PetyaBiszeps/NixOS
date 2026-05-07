# Nix garbage collection module
# Provides automatic Nix cleanup through nh
# Be careful when modifying this file, as it may affect your garbage collector settings

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
