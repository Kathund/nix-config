{
  config,
  lib,
  username,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users.${username}.wayland.windowManager.hyprland.settings.config = {
      animations.enabled = false;
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
        allow_tearing = false;
        resize_on_border = false;
        col = {
          active_border = {
            colors = [
              "rgba(f5c2e7ee)"
              "rgba(cba6f7ee)"
            ];
            angle = 45;
          };
          inactive_border = "rgba(595959aa)";
        };
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow.enabled = false;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
    };
  };
}
