{
  config,
  lib,
  username,
  ...
}:
let
  program = "chromium";
  cfg = config.modules.browsers.${program};
in
{
  options.modules.browsers.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
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
          programs = {
            ${program} = {
              enable = true;
            };
          };
          wayland = lib.mkIf cfg.hyprlandBind {
            windowManager = {
              hyprland = {
                settings = {
                  bind = [ "SUPER, S, exec, ${program}" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
