{
  config,
  lib,
  username,
  ...
}:
let
  program = "hyprlock";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = {
      services.hypridle = {
        enable = true;
        settings = {
          general = {
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "${program}";
            unlock_cmd = "pkill -USR1 ${program}";
          };
          listener = [
            {
              timeout = 180;
              on-timeout = "brightnessctl -s set 10";
              on-resume = "brightnessctl -r";
            }
            {
              timeout = 300;
              on-timeout = "${program}";
            }
          ];
        };
      };
      programs."${program}" = {
        enable = true;
        settings = {
          general = {
            disable_loading_bar = true;
            hide_cursor = true;
            immediate_render = true;
            no_fade_in = false;
            grace = 1;
          };
          background = {
            path = "screenshot";
            blur_passes = 2;
            contrast = 0.8916;
            brightness = 0.8172;
            vibrancy = 0.1696;
            vibrancy_darkness = 0.0;
          };
        };
      };
      wayland.windowManager.hyprland.settings.bind = lib.mkIf cfg.hyprlandBind [
        "SUPER, L, exec, ${program}"
      ];
    };
  };
}
