# User module
# Provides user and home-manager configuration
# Feel free to add, remove and modify anything here

{ config, inputs, pkgs, lib, ... }:
  let
  # variables.nix
  vars = config.variables;

  enableNewUser = vars.enableNewUser or false;

  username = vars.username or "";
  hashedPassword = vars.hashedPassword or "";

  gitUsername = vars.gitUsername or username;
  defaultShell = vars.defaultShell or "zsh";
  shellPackage = if defaultShell == "fish" then pkgs.fish else pkgs.zsh;

  hasUser = username != "" && username != null;
  hasPassword = hashedPassword != "" && hashedPassword != null;
in {
  config = lib.mkMerge [{
    assertions = [{
      assertion = (!enableNewUser) || (hasUser && hasPassword);
      message = "enableNewUser is true, but username or hashedPassword is not set";
    }];
} (lib.mkIf hasUser {
      programs.zsh.enable = true;
      programs.fish.enable = true;

      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = false;
        backupFileExtension = "backup";

        extraSpecialArgs = {
          inherit inputs;

          variables = vars;
          username = username;
        };

        users.${username} = {
          imports = [ ../home ];

          programs.git = {
            enable = true;

            settings = {
              user.name = vars.gitUsername;
              user.email = vars.gitEmail;
              init.defaultBranch = "main";
              pull.rebase = true;
              # You can add more git-specific logic here...
            };
          };

          home = {
            username = username;
          homeDirectory = "/home/${username}";
            stateVersion = "26.05";
          };
        };
      };

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
        shell = shellPackage;
        ignoreShellProgramCheck = true;
      } // lib.optionalAttrs enableNewUser {
        initialHashedPassword = hashedPassword;
      };

      nix.settings.allowed-users = [ username ];
  })];

  programs = {
    dconf.enable = true;
    xwayland.enable = true;
  };

  # Services to start
  services = {
    gvfs.enable = true;
    dbus.enable = true;
    upower.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    libinput.enable = true;
    gnome.gnome-keyring.enable = true;

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  # XDG portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Qt6 related kits
    qt6.qt5compat
    qt6.qtbase
    qt6.qtquick3d
    qt6.qtwayland
    qt6.qtdeclarative
    qt6.qtsvg

    git
    wget
    curl
    unzip
  ];

  # necessary environment variables
  environment.variables = {
    QML_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
    QML2_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
  };

  # make sure the Qt application is working properly
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  security = {
    rtkit.enable = true;

    polkit = {
      enable = true;

      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if ( subject.isInGroup("users") && (
           action.id == "org.freedesktop.login1.reboot" ||
           action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
           action.id == "org.freedesktop.login1.power-off" ||
           action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          ))
          { return polkit.Result.YES; }
        })
      '';
    };
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  services.displayManager = {
    defaultSession = "niri";
    
    sessionPackages = with pkgs; [
      niri
    ];
  };

  services.displayManager = {
    ly = {
      enable = true;

      settings = {
        save = false;
        xinitrc = null;
        xsessions = null;
        animation = "matrix"; # -> "doom", "colormix", "matrix"
        save_file = "/var/lib/ly/save";
        hide_users = "nixbld1,nixbld2,nixbld3,nixbld4,nixbld5,nixbld6,nixbld7,nixbld8,nixbld9,nixbld10,nixbld11,nixbld12,nixbld13,nixbld14,nixbld15,nixbld16,nixbld17,nixbld18,nixbld19,nixbld20,nixbld21,nixbld22,nixbld23,nixbld24,nixbld25,nixbld26,nixbld27,nixbld28,nixbld29,nixbld30,nixbld31,nixbld32";
        default_input = "password";
        # hide_borders = true;
        hide_system_users = true;
        # min_refresh_delta = 5;
      };
    };
  };

  security = {
    pam.services.ly.enableGnomeKeyring = true;
  };

  # temporary files
  systemd.tmpfiles.rules = [
    "d /var/lib/ly 0755 root root -"
  ];
}
