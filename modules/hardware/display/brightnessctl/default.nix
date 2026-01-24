{
  config,
  lib,
  username,
  ...
}:
let
  program = "brightnessctl";
  cfg = config.modules.hardware.display.${program};
in
{
  options.modules.hardware.display.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [
                brightnessctl
              ];
            };
            wayland = {
              windowManager = {
                hyprland = {
                  settings = {
                    bindel = [
                      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
                      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
                    ];
                  };
                };
              };
            };
          };
      };
    };
  };
}
