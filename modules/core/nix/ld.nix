# Nix ld module
# Provides nix-ld compatibility support
# Be careful modifying this module, as it can break compatibility with Nix packages

{ ... }: {
  programs.nix-ld = {
    enable = true;

    # libraries = with pkgs; [
    #   
    # ];
  };
}
