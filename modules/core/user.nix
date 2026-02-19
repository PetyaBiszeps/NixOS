# User module
# Provides user and home-manager configuration
# Feel free to add, remove and modify anything here

{ config, pkgs, inputs, username, ... }:
  let
    vars = config.variables;
    gitUsername = vars.gitUsername or username;
    defaultShell = vars.defaultShell or "zsh";
    shellPackage = if defaultShell == "fish" then pkgs.fish else pkgs.zsh;
in {
  programs.zsh.enable = true;
  programs.fish.enable = true;

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit inputs username;
    };

    users.${username} = {
      imports = [ ../home ];

      home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.11";
      };
    };
  };

  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = gitUsername;
    extraGroups = [
      "adbusers"
      "docker"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
      "vboxusers"
    ];
    shell = shellPackage;
    ignoreShellProgramCheck = true;
  };

  nix.settings.allowed-users = [username];
}