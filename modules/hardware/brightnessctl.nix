{
  config,
  lib,
  username,
  ...
}:
let
  program = "brightnessctl";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ brightnessctl ];
        wayland.windowManager.hyprland.settings.bindel = lib.mkIf cfg.hyprlandBind [
          ", XF86MonBrightnessUp, exec, ${program} set +5%"
          ", XF86MonBrightnessDown, exec, ${program} set 5%-"
        ];
      };
  };
}
