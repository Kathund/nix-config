{
  config,
  lib,
  inputs,
  pkgs,
  username,
  ...
}:
let
  program = "split-monitor-workspaces";
  cfg = config.modules.hypr.land.plugins.${program};
in
{
  options.modules.hypr.land.plugins.${program} = {
    enable = lib.mkEnableOption { description = "Enable hyprland plugin ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          wayland = {
            windowManager = {
              hyprland = {
                plugins = [
                  inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
                ];
                settings = {
                  plugin = {
                    split-monitor-workspaces = {
                      enable_persistent_workspaces = false;
                      monitor_priority = lib.concatStringsSep ", " [
                        "DP-1"
                        "HDMI-A-1"
                      ];
                    };
                  };
                  bind = [
                    "SUPER, 0, split-workspace, 10"
                    "SUPER SHIFT, 0, split-movetoworkspace, 10"
                  ]
                  ++
                    # workspaces: binds SUPER + [shift +] {1..9} to [move to] workspace {1..9}
                    (builtins.concatLists (
                      builtins.genList (
                        i:
                        let
                          ws = i + 1;
                        in
                        [
                          "SUPER, code:1${toString i}, split-workspace, ${toString ws}"
                          "SUPER SHIFT, code:1${toString i}, split-movetoworkspace, ${toString ws}"
                        ]
                      ) 9
                    ));
                };
              };
            };
          };
        };
      };
    };
  };
}
