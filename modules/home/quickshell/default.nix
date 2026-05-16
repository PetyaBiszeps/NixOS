# Quickshell default.nix module
# Provides modular aggregator for Quickshell runtime and shell implementations

{ lib, pkgs, inputs, variables, ... }:
  let
    desktopShell = variables.desktopShell or "none";

    enableQuickshell = builtins.elem desktopShell [
      "noctalia"
    ];
in {
  imports = [
    ./noctalia.nix
  ];

  config = lib.mkIf enableQuickshell {
    home.packages = with pkgs; [
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default

      qt6.qt5compat
      qt6.qtbase
      qt6.qtquick3d
      qt6.qtwayland
      qt6.qtdeclarative
      qt6.qtsvg
    ];

    home.sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
      QML_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
      QML2_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };
}
