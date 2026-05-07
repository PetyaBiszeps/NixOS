# Nix helper tools module
# Provides Nix maintenance and build inspection tools
# Be careful when modifying this file, as it may affect Nix tools that presented in your system

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nvd
    nix-output-monitor
  ];
}
