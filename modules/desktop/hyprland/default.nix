{
  config,
  lib,
  inputs,
  pkgs,
  username,
  ...
}:
let
  program = "hyprland";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    loadWorkspaceBinds = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  imports = [ ./plugins ];

  config = lib.mkIf cfg.enable {
    programs."${program}" = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      ];
    };
    home-manager.users.${username}.wayland.windowManager.${program} = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      settings = {
        env = [
          "NIXOS_OZONE_WL, 1"
          "XCURSER_SIZE, 24"
          "IXPKGS_ALLOW_UNFREE, 1"
        ];
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgba(f5c2e7ee) rgba(cba6f7ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };
        decoration = {
          rounding = 10;
          rounding_power = 2;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };
        animations.enabled = false;
        master.new_status = "master";
        misc = {
          force_default_wallpaper = -1;
          disable_hyprland_logo = false;
        };
        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = {
            natural_scroll = true;
            scroll_factor = 1;
          };
        };

        bind = [
          "SUPER, C, killactive"
          "SUPER, V, togglefloating,"
          "SUPER, M, exit,"
          "SUPER, P, pseudo,"
          "SUPER, left, movefocus, l"
          "SUPER, right, movefocus, r"
          "SUPER, up, movefocus, u"
          "SUPER, down, movefocus, d"
        ]
        ++ lib.optionals cfg.loadWorkspaceBinds (
          [
            "SUPER, 0, workspace, 10"
            "SUPER SHIFT, 0, movetoworkspace, 10"
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
                  "SUPER, code:1${toString i}, workspace, ${toString ws}"
                  "SUPER SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              ) 9
            ))
        );

        bindm = [
          "SUPER, mouse:272, movewindow"
          "SUPER, mouse:273, resizewindow"
        ];
      };
    };
  };
}
