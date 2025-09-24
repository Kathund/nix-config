{
  config,
  lib,
  username,
  pkgs,
  ...
}:
let
  program = "rofi";
  cfg = config.programs.misc.${program};
in
{
  options.programs.misc.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
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
              theme = "/home/${username}/nix-config/programs/misc/rofi/themes/rounded-nord-dark.rasi";
            };
          };
          wayland = {
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
