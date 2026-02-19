# Nix garbage collector module
# Provides garbage auto cleaning
# Feel free to add, remove and modify anything here

{ pkgs, username, ... }: {
  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    # flake = "/home/${username}/nixos";
  };

  environment.systemPackages = with pkgs; [
    nvd
    nix-output-monitor
  ];
}