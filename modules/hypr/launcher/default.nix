{
  config,
  lib,
  username,
  ...
}:
let
  program = "launcher";
  cfg = config.modules.hypr.${program};
in
{
  options.modules.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
    hyprlandBind = lib.mkOption {
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
            };
          };
          wayland = lib.mkIf cfg.hyprlandBind {
            windowManager = {
              hyprland = {
                settings = {
                  bind = [ "SUPERSHIFT, S, exec, hypr${program}" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
