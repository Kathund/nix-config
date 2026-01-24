{
  config,
  lib,
  username,
  ...
}:
let
  program = "shot";
  cfg = config.modules.hypr.${program};
in
{
  options.modules.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
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
                hyprshot
              ];
            };
            wayland = {
              windowManager = {
                hyprland = {
                  settings = {
                    bind = [
                      ", PRINT, exec, hyprshot -m region --freeze --clipboard-only"
                      "SUPER, PRINT, exec, killall hyprpicker"
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
