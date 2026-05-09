{
  config,
  lib,
  username,
  ...
}:
let
  program = "hyprshot";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ hyprshot ];
        wayland.windowManager.hyprland.settings.bind = lib.mkIf cfg.hyprlandBind [
          ", PRINT, exec, ${program} -m region --freeze --clipboard-only"
        ];
      };
  };
}
