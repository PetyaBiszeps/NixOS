# Default host-specific variables and feature toggles
# Private per-machine values should be placed in variables.local.nix.

let
  # Check local file
  localVars =
    if builtins.pathExists ./variables.local.nix
    then import ./variables.local.nix
    else {
      enableNewUser = false;

      username = null;
      hashedPassword = null;

      gitUsername = null;
      gitEmail = null;
    };
in {
  # System
  timeZone = "Europe/Kyiv";
  defaultLocale = "en_US.UTF-8";
  keyboardLayout = "us,ru,ua";
  monitorSettings = "monitor=,preferred,auto,1";

  # Local
  inherit (localVars)
    enableNewUser

    username
    hashedPassword

    gitUsername
    gitEmail;

  # Enable NFS
  enableNFS = false;

  # Enable printing support
  printEnable = true;

  # Enable development support
  devSupportEnable = true;

  # Enable gaming support (controllers, gamescope, protonup-qt)
  gamingSupportEnable = true;

  # Display manager choice
  displayManager = "ly";

  # Desktop session environment choice
  defaultSession = "niri";

  # Quickshell Choice
  desktopShell = "noctalia";
  
  # Shell choice
  defaultShell = "zsh";

  # Software choice
  IDE = "zeditor";
  browser = "brave";
  terminal = "ghostty";
  fileManager = "nautilus";
}
