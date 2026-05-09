{
  config,
  lib,
  username,
  ...
}:
let
  program = "awww";
  cfg = config.modules.misc.${program};
in
{
  options.modules.misc.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    timeout = lib.mkOption {
      type = lib.types.ints.positive;
      default = 30;
      description = "Time between wallpaper changes (in minutes)";
    };
    directory = lib.mkOption {
      type = lib.types.str;
      default = "${config.modules.configPath}/assets/walls-catppuccin-mocha";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            wayland = {
              windowManager = {
                hyprland = {
                  settings = {
                    exec-once = [ "update-wallpaper" ];
                  };
                };
              };
            };
            home = {
              packages = [
                (pkgs.writeShellScriptBin "update-wallpaper" ''
                  awww-daemon
                  cd ${cfg.directory}
                  while : ; do
                      export CURRENT_WALLPAPER="$(ls *.jpg *.png *.jpeg 2>/dev/null | sort -R | tail -1)"
                      awww img "$CURRENT_WALLPAPER" --transition-type random --transition-fps 60 --transition-duration 1
                      echo "\$WALLPAPER=${cfg.directory}/$CURRENT_WALLPAPER" > /tmp/.current_wallpaper_path_hyprlock
                      export WALLPAPER="${cfg.directory}/$CURRENT_WALLPAPER"
                      echo "$WALLPAPER" > /tmp/.current_wallpaper_path
                      sleep $(( ${toString (cfg.timeout * 60)} ))
                  done
                '')
                pkgs.awww
              ];
            };
          };
      };
    };
  };
}
