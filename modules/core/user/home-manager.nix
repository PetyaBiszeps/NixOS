# Home Manager module
# Provides Home Manager user configuration
# Be careful modifying this module, as it affects user environment

{ config, inputs, lib, ... }:
  let
    vars = config.variables;

    username = vars.username or "";
    gitUsername = vars.gitUsername or username;
    gitEmail = vars.gitEmail or "";

    hasUser = username != "" && username != null;
in lib.mkIf hasUser {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit inputs;

      variables = vars;
      username = username;
    };

    users.${username} = {
      imports = [ ../../home ];

      programs.git = {
        enable = true;

        settings = {
          user.name = gitUsername;
          user.email = gitEmail;
          init.defaultBranch = "main";
          pull.rebase = true;
        };
      };

      home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "26.05";
      };
    };
  };
}
