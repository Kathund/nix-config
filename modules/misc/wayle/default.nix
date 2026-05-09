{
  config,
  lib,
  username,
  ...
}:
let
  program = "wayle";
  cfg = config.modules.misc.${program};
in
{
  options.modules.misc.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          services = {
            ${program} = {
              enable = true;
              settings = {
                bar = {
                  location = "bottom";
                  scale = 0.65;
                  layout = {
                    monitor = "*";
                    show = true;
                    left = [
                      "hyprland-workspaces"
                      "media"
                    ];
                    right = [
                      "microphone"
                      "volume"
                      "systray"
                      "clock"
                      "notifications"
                    ];
                  };
                };
                general = {
                  font-mono = "JetBrainsMono Nerd Font Mono";
                  font-sans = "JetBrainsMono Nerd Font Mono";
                };
                modules = {
                  clock = {
                    dropdown-show-seconds = true;
                    format = "%d %H:%M:%S";
                    icon-show = false;
                    label-color = "red";
                  };
                  hyprland-workspaces = {
                    active-color = "red";
                    active-indicator = "underline";
                    occupied-color = "red";
                  };
                  media = {
                    icon-bg-color = "transparent";
                    icon-color = "blue";
                    players-ignored = [ "*playerctld" ];
                  };
                  microphone = {
                    icon-bg-color = "transparent";
                    icon-color = "red";
                  };
                  notification = {
                    icon-bg-color = "transparent";
                    icon-color = "blue";
                    label-color = "blue";
                    popup-position = "bottom-right";
                    middle-click = "wayle notify dismiss-all";
                  };
                  systray = {
                    icon-scale = 1.25;
                    item-gap = 0.75;
                  };
                  volume = {
                    icon-bg-color = "transparent";
                    icon-color = "red";
                  };
                };
                osd = {
                  margin = 50.0;
                  position = "top-right";
                };
                styling = {
                  scale = 0.75;
                };
                styling.palette = {
                  bg = "#11111b";
                  blue = "#74c7ec";
                  elevated = "#1e1e2e";
                  fg = "#cdd6f4";
                  fg-muted = "#bac2de";
                  green = "#a6e3a1";
                  primary = "#b4befe";
                  red = "#f38ba8";
                  surface = "#181825";
                  yellow = "#f9e2af";
                };
                wallpaper = {
                  engine-enabled = false;
                };
              };
            };
          };
          wayland = lib.mkIf cfg.loadOnStartup {
            windowManager = {
              hyprland = {
                settings = {
                  exec-once = [ "wayle" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
