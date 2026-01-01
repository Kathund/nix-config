{
  config,
  lib,
  username,
  ...
}:
let
  program = "kitty";
  cfg = config.modules.terminal.${program};
in
{
  options.modules.terminal.${program} = {
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
              settings = {
                # font_size = 16;
                background_opacity = 0.5;
                scrollback_lines = 2000;
                wheel_scroll_min_lines = 1;
                window_padding_width = 4;
                confirm_os_window_close = 0;
              };
            };
          };
          wayland = {
            windowManager = {
              hyprland = {
                settings = {
                  bind = [ "SUPER, Q, exec, kitty" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
