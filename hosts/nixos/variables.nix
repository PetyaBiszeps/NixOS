# Default host variables
# Vocabulary for important constants
# Do not edit manually. This file is overwritten per-machine, changes can lead to unexpected results

{ config, lib }:
  let
    # Check local file
    localVars = if builtins.pathExists ./variables.local.nix
                then import ./variables.local.nix
                else {
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
    username
    hashedPassword
    gitUsername
    gitEmail;

  # Software
  IDE = "zeditor";
  browser = "brave";
  terminal = "ghostty";

  # Enable new user
  enableNewUser = true;

  # Enable NFS
  enableNFS = true;

  # Enable printing support
  printEnable = true;

  # Enable Nautilus GUI file manager
  nautilusEnable = true;

  # Enable gaming support (controllers, gamescope, protonup-qt)
  gamingSupportEnable = true;

  # Shell choice
  defaultShell = "zsh";

  # Quickshell Choice
  desktopShell = "noctalia";
}