# Nix ld module
# Provides nix-ld compatibility support

{ ... }: {
  programs.nix-ld = {
    enable = true;

    # libraries = with pkgs; [
    #   
    # ];
  };
}
