{
  config,
  lib,
  username,
  ...
}:
let
  program = "kitty";
  cfg = config.modules.applications.${program};
in
{
  options.modules.applications.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.${program} = {
        enable = true;
        settings = {
          background_opacity = 0.5;
          scrollback_lines = 2000;
          wheel_scroll_min_lines = 1;
          window_padding_width = 4;
          confirm_os_window_close = 0;
        };
      };
      catppuccin.${program}.enable = false;
      wayland.windowManager.hyprland.settings.bind = lib.mkIf cfg.hyprlandBind [
        "SUPER, Q, exec, ${program}"
      ];
    };
  };
}
