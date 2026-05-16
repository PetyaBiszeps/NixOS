# Git home module
# Provides Git configuration for the home module

{ variables, username, ... }:
  let
    gitUsername =
      if (variables.gitUsername or null) != null && (variables.gitUsername or "") != ""
      then variables.gitUsername
      else username;
    gitEmail =
      if (variables.gitEmail or null) != null
      then variables.gitEmail
      else "";
in {
  programs.git = {
    enable = true;

    settings = {
      user.name = gitUsername;
      user.email = gitEmail;
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
