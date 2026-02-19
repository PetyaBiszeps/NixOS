# Keyboard module
# Provides locales setup
# Feel free to add any language except polish

{ config, ... }:
  let
    keyboardLayout = config.variables.keyboardLayout or "us";
    defaultLocale = config.variables.defaultLocale or "en_US.UTF-8";
in {
  i18n.defaultLocale = defaultLocale;

  services.xserver.xkb = {
    layout = keyboardLayout;
    variant = "";
  };
}