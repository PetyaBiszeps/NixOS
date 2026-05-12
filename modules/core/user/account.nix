# User account module
# Provides system user account configuration
# Be careful modifying this module, as it affects user login

{ config, lib, ... }:
  let
    vars = config.variables;

    enableNewUser = vars.enableNewUser or false;

    username = vars.username or "";
    hashedPassword = vars.hashedPassword or "";
    gitUsername =
      if (vars.gitUsername or null) != null && (vars.gitUsername or "") != ""
      then vars.gitUsername
      else username;

    hasUser = username != "" && username != null;
    hasPassword = hashedPassword != "" && hashedPassword != null;
in {
  config = lib.mkMerge [
    {
      assertions = [
        {
          assertion = (!enableNewUser) || (hasUser && hasPassword);
          message = "enableNewUser is true, but username or hashedPassword is not set";
        }
      ];
    }

    (lib.mkIf hasUser {
      users.mutableUsers = true;

      users.users.${username} = {
        isNormalUser = true;
        description = gitUsername;

        extraGroups = [
          "lp"
          "wheel"
          "scanner"
          "networkmanager"
          
          # "docker" -> added by docker.nix, other commented groups should be a separate modules
          # "adbusers"
          # "libvirtd"
          # "vboxusers"
        ];

        ignoreShellProgramCheck = true;
      } // lib.optionalAttrs enableNewUser {
        initialHashedPassword = hashedPassword;
      };
    })
  ];
}
