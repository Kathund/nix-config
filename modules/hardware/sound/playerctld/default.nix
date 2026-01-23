{
  config,
  lib,
  username,
  ...
}:
let
  program = "playerctld";
  cfg = config.modules.hardware.sound.${program};
in
{
  options.modules.hardware.sound.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          services = {
            ${program} = {
              enable = true;
            };
          };
          wayland = {
            windowManager = {
              hyprland = {
                settings = {
                  bindl = [
                    ", XF86AudioPlay, exec, playerctl play-pause"
                    ", XF86AudioPrev, exec, playerctl previous"
                    ", XF86AudioNext, exec, playerctl next"
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
