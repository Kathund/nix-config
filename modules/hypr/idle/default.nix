{
  config,
  lib,
  username,
  ...
}:
let
  program = "idle";
  cfg = config.modules.hypr.${program};
in
{
  options.modules.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          services = {
            "hypr${program}" = {
              enable = true;
              settings = {
                general = {
                  after_sleep_cmd = "hyprctl dispatch dpms on";
                  ignore_dbus_inhibit = false;
                  lock_cmd = "hyprlock";
                  unlock_cmd = "pkill -USR1 hyprlock";
                };
                listener = [
                  {
                    timeout = 180;
                    on-timeout = "brightnessctl -s set 10";
                    on-resume = "brightnessctl -r";
                  }
                  {
                    timeout = 300;
                    on-timeout = "hyprlock";
                  }
                ];
              };
            };
          };
        };
      };
    };
  };
}
