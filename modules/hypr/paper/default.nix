{
  config,
  lib,
  username,
  ...
}:
let
  program = "paper";
  cfg = config.modules.hypr.${program};
in
{
  options.modules.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "${config.modules.configPath}/assets/wallpaper.png";
    };
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
            "hypr${program}" = {
              enable = true;
              settings = {
                splash = false;
                wallpaper = [
                  {
                    monitor = "DP-1";
                    path = cfg.wallpaper;
                  }
                ];
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
