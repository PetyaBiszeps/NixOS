# Nix ld module
# Provides nix-ld compatibility support

{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      libGL
      libGLU
      libGLX
    ];
  };
}
