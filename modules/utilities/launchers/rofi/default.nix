{
  config,
  lib,
  username,
  pkgs,
  ...
}:
let
  program = "rofi";
  cfg = config.modules.utilities.launchers.${program};
in
{
  options.modules.utilities.launchers.${program} = {
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
              package = pkgs.rofi;
              theme = lib.mkForce "${config.modules.configPath}/modules/utilities/launchers/rofi/themes/rounded-nord-dark.rasi";
            };
          };
          wayland = lib.mkIf cfg.hyprlandBind {
            windowManager = {
              hyprland = {
                settings = {
                  bind = [ "SUPERSHIFT, S, exec, rofi -show drun -show-icons" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
