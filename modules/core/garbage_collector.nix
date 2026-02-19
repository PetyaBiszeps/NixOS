# Nix garbage collector module
# Provides garbage auto cleaning
# Feel free to add, remove and modify anything here

{ config, pkgs, ... }: {
  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    # flake = "/home/${config.variables.username}/nixos";
  };

  environment.systemPackages = with pkgs; [
    nvd
    nix-output-monitor
  ];
}