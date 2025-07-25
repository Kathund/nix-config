{
  config,
  lib,
  username,
  ...
}:
let
  program = "paper";
  cfg = config.programs.hypr.${program};
in
{
  options.programs.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "/home/${username}/nix-config/assets/wallpaper.png";
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
                ipc = "on";
                splash = false;
                splash_offset = 2.0;
                preload = [ cfg.wallpaper ];
                wallpaper = [ ", ${cfg.wallpaper}" ];
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
