{
  config,
  lib,
  inputs,
  pkgs,
  username,
  ...
}:
let
  program = "lock";
  cfg = config.programs.hypr.${program};
in
{
  options.programs.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
    lockscreen = lib.mkOption {
      type = lib.types.str;
      default = "/home/${username}/nix-config/assets/lockscreen.png";
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
                label = [
                  {
                    text = "$TIME";
                    color = "rgb(205, 214, 244)";
                    font_size = 128;
                    font_family = "JetBrainsMono Nerd Font";
                    position = "0, -128";
                    shadow_passes = 1;
                    shadow_boost = 0.5;
                    valign = "top";
                    halign = "center";
                  }
                ];
                background = {
                  path = cfg.lockscreen;
                  blur_passes = 2;
                  contrast = 0.8916;
                  brightness = 0.8172;
                  vibrancy = 0.1696;
                  vibrancy_darkness = 0.0;
                };
                input-field = {
                  size = "320, 64";
                  inner_color = "rgba(69, 71, 90, 0.5)";
                  outer_color = "rgba(255, 255, 255, 0)";
                  fail_color = "rgb(243, 139, 168)";
                  check_color = "rgba(49, 50, 68, 0.4)";
                  font_color = "rgb(205, 214, 244)";
                  fade_on_empty = true;
                  position = "0, 128";
                  font_family = "Open Sans";
                  valign = "bottom";
                  halign = "center";
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
