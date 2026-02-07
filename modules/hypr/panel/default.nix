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
        default = "16px";
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
                  };
                  osd = {
                    duration = 1500;
                    orientation = "horizontal";
                    location = cfg.osd.location;
                  };
                  font = {
                    size = cfg.font.size;
                  };
                };
                bar = {
                  layouts = {
                    "*" = {
                      left = [
                        "dashboard"
                        "workspaces"
                        "windowtitle"
                      ];
                      middle = [ ];
                      right = [
                        "custom/mic"
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
                    showWsIcons = true;
                    showApplicationIcons = true;
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
                  dashboard = {
                    shortcuts = {
                      left = {
                        shortcut1 = {
                          icon = "󰈹";
                          command = "firefox";
                          tooltip = "firefox";
                        };
                        shortcut2 = {
                          icon = "";
                          command = "";
                          tooltip = "";
                        };
                        shortcut3 = {
                          icon = "󰄛";
                          command = "kitty";
                          tooltip = "meow";
                        };
                        shortcut4 = {
                          icon = "";
                          command = "";
                          tooltip = "";
                        };
                      };
                      right = {
                        shortcut1 = {
                          icon = "";
                          command = "";
                          tooltip = "";
                        };
                        shortcut2 = {
                          icon = "";
                          command = "";
                          tooltip = "";
                        };
                        shortcut3 = {
                          icon = "";
                          command = "";
                          tooltip = "";
                        };
                        shortcut4 = {
                          icon = "";
                          command = "";
                          tooltip = "";
                        };
                      };
                    };
                    directories = {
                      enabled = false;
                    };
                    stats = {
                      enable_gpu = false;
                    };
                  };
                };
              };
            };
          };
          wayland = {
            windowManager = {
              hyprland = {
                settings = {
                  exec-once = [ "hypr${program}" ];
                };
              };
            };
          };
          home = {
            file = {
              ".config/hyprpanel/modules.json" = {
                source = ./modules.json;
              };
            };
          };
        };
      };
    };
  };
}
