# User module
# Provides user and home-manager configuration
# Feel free to add, remove and modify anything here

{ config, inputs, pkgs, lib, ... }:
let
  # variables.nix
  vars = config.variables;

  username = vars.username or "";
  hashedPassword = vars.hashedPassword or "";
  enableNewUser = vars.enableNewUser or false;

  gitUsername = vars.gitUsername or username;
  defaultShell = vars.defaultShell or "zsh";
  shellPackage = if defaultShell == "fish" then pkgs.fish else pkgs.zsh;

  hasUser = username != "" && username != null;
  hasPassword = hashedPassword != "" && hashedPassword != null;
in {
  assertions = [{
    assertion = (!enableNewUser) || (hasUser && hasPassword);
    message = "enableNewUser is true, but username or hashedPassword is not set";
  }];

  config = lib.mkIf hasUser {
    programs.zsh.enable = true;
    programs.fish.enable = true;

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = false;
      backupFileExtension = "backup";

      extraSpecialArgs = {
        inherit inputs;
        username = username;
      };

      users.${username} = {
        imports = [ ../home ];

        home = {
          username = username;
          homeDirectory = "/home/${username}";
          stateVersion = "26.05";
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
    } // lib.optionalAttrs enableNewUser {
      initialHashedPassword = hashedPassword;
    };

    nix.settings.allowed-users = [username];
  };
}