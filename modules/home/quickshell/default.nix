# Quickshell module
# Provides Quickshell runtime and shell implementations
# Be careful when modifying this module, as it may break the shell

{ lib, pkgs, inputs, variables, ... }:
  let
    desktopShell = variables.desktopShell or "none";

    enableQuickshell = builtins.elem desktopShell [
      "noctalia"
    ];
in lib.mkMerge [
  {
    imports = [
      ./noctalia.nix
    ];
  }

  (lib.mkIf enableQuickshell {
    home.packages = with pkgs; [
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default

      # Qt6 related kits
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
  })
]
