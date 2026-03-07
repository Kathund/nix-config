{
  config,
  lib,
  username,
  inputs,
  pkgs,
  ...
}:
let
  program = "panel";
  cfg = config.modules.hypr.${program};
in
{
  options.modules.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    bar = {
      transparent = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      location = lib.mkOption {
        type = lib.types.enum [
          "top"
          "bottom"
        ];
        default = "bottom";
        description = "Change hypr${program}'s bar location";
      };
    };
    osd = {
      location = lib.mkOption {
        type = lib.types.enum [
          "top"
          "bottom"
        ];
        default = "top";
        description = "Change hypr${program}'s osd location";
      };
    };
    font = {
      size = lib.mkOption {
        type = lib.types.str;
        default = "0.7rem";
        description = "Change hypr${program}'s font size";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          programs = {
            "hypr${program}" = {
              enable = true;
              package = inputs.hyprpanel.packages.${pkgs.stdenv.hostPlatform.system}.default;
              settings = {
                theme = {
                  bar = {
                    transparent = cfg.bar.transparent;
                    location = cfg.bar.location;
                    border = {
                      width = "0em";
                    };
                    border_radius = "0em";
                    outer_spacing = "0.2em";
                    buttons = {
                      padding_x = "0.4rem";
                      padding_y = "0rem";
                      radius = "0em";
                      spacing = "0.2em";
                      y_margins = "0.2em";
                    };
                  };
                  osd = {
                    duration = 1500;
                    orientation = "horizontal";
                    location = cfg.osd.location;
                  };
                  font = {
                    size = cfg.font.size;
                    name = "JetBrainsMonoNL Nerd Font Mono";
                    label = "JetBrainsMonoNL Nerd Font Mono";
                  };
                };
                bar = {
                  layouts = {
                    "*" = {
                      left = [
                        "workspaces"
                      ];
                      middle = [ ];
                      right = [
                        "systray"
                        "clock"
                        "notifications"
                      ];
                    };
                  };
                  autoHide = "never";
                  launcher = {
                    autoDetectIcon = true;
                    icon = "fuck";
                  };
                  workspaces = {
                    showApplicationIcons = false;
                    showWsIcons = false;
                    show_numbered = true;
                    show_icons = false;
                    spacing = 0.5;
                  };
                  network = {
                    showWifiInfo = true;
                  };
                  clock = {
                    format = "%d %H:%M:%S";
                  };
                  notifications = {
                    hideCountWhenZero = true;
                    show_total = true;
                  };
                };
                notifications = {
                  timeout = 5000;
                  showActionsOnHover = true;
                  autoDismiss = false;
                  clearDelay = 100;
                  position = "bottom right";
                };
                menus = {
                  clock = {
                    time = {
                      hideSeconds = true;
                      military = true;
                    };
                    weather = {
                      unit = "metric";
                    };
                  };
                };
              };
            };
          };
          wayland = lib.mkIf cfg.loadOnStartup {
            windowManager = {
              hyprland = {
                settings = {
                  exec-once = [ "hypr${program}" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
