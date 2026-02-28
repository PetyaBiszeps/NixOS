# Keyboard module
# Provides locales setup
# Feel free to add any language except polish

{ config, ... }:
  let
    keyboardLayout = config.variables.keyboardLayout or "us";
    defaultLocale = config.variables.defaultLocale or "en_US.UTF-8";
in {
  i18n.defaultLocale = defaultLocale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
    "uk_UA.UTF-8/UTF-8"
  ];

  services.xserver.xkb = {
    layout = keyboardLayout;
    variant = "";
    options = "grp:alt_shift_toggle";
  };
}