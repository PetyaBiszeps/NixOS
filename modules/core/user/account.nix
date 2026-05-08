# User account module
# Provides system user account configuration
# Be careful modifying this module, as it affects user login

{ config, lib, ... }:
  let
    vars = config.variables;

    enableNewUser = vars.enableNewUser or false;

    username = vars.username or "";
    hashedPassword = vars.hashedPassword or "";
    gitUsername = vars.gitUsername or username;

    hasUser = username != "" && username != null;
    hasPassword = hashedPassword != "" && hashedPassword != null;
in {
  assertions = [
    {
      assertion = (!enableNewUser) || (hasUser && hasPassword);
      message = "enableNewUser is true, but username or hashedPassword is not set";
    }
  ];

  config = lib.mkIf hasUser {
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

      ignoreShellProgramCheck = true;
    } // lib.optionalAttrs enableNewUser {
      initialHashedPassword = hashedPassword;
    };
  };
}
