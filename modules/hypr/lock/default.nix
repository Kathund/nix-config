{
  config,
  lib,
  username,
  ...
}:
let
  program = "lock";
  cfg = config.modules.hypr.${program};
in
{
  options.modules.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
    lockscreen = lib.mkOption {
      type = lib.types.str;
      default = "${config.modules.configPath}/assets/lockscreen.png";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          programs = {
            "hypr${program}" = {
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
                  path = cfg.lockscreen;
                  blur_passes = 2;
                  contrast = 0.8916;
                  brightness = 0.8172;
                  vibrancy = 0.1696;
                  vibrancy_darkness = 0.0;
                };
              };
            };
          };
          wayland = {
            windowManager = {
              hyprland = {
                settings = {
                  bind = [ "SUPER, L, exec, hypr${program}" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
