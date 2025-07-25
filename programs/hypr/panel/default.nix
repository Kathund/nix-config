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
  cfg = config.programs.hypr.${program};
in
{
  options.programs.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          programs = {
            "hypr${program}" = {
              enable = true;
              package = inputs.hyprpanel.packages.${pkgs.system}.default;
              settings = {
                theme = {
                  bar = {
                    location = "bottom";
                  };
                  osd = {
                    duration = 1500;
                    orientation = "horizontal";
                    location = "top";
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
                      right = [
                        "network"
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
                    format = "%d  %I:%M";
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
        };
      };
    };
  };
}
