{
  config,
  lib,
  inputs,
  pkgs,
  username,
  ...
}:
let
  program = "land";
  cfg = config.modules.hypr.${program};
in
{
  options.modules.hypr.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable hypr${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage =
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
    };
    xdg = {
      portal = {
        enable = true;
        extraPortals = [
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
        ];
      };
    };
    home-manager = {
      users = {
        ${username} = {
          wayland = {
            windowManager = {
              hyprland = {
                enable = true;
                package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
                portalPackage =
                  inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
                settings = {
                  monitor = [ ", preferred, auto, 1" ];
                  env = [
                    "NIXOS_OZONE_WL, 1"
                    "XCURSER_SIZE, 24"
                    "IXPKGS_ALLOW_UNFREE, 1"
                  ];
                  general = {
                    gaps_in = 5;
                    gaps_out = 20;
                    border_size = 2;
                    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
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
                  animations = {
                    enabled = true;
                    bezier = [
                      "easeOutQuint,0.23,1,0.32,1"
                      "easeInOutCubic,0.65,0.05,0.36,1"
                      "linear,0,0,1,1"
                      "almostLinear,0.5,0.5,0.75,1.0"
                      "quick,0.15,0,0.1,1"
                    ];
                    animation = [
                      "global, 1, 10, default"
                      "border, 1, 5.39, easeOutQuint"
                      "windows, 1, 4.79, easeOutQuint"
                      "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                      "windowsOut, 1, 1.49, linear, popin 87%"
                      "fadeIn, 1, 1.73, almostLinear"
                      "fadeOut, 1, 1.46, almostLinear"
                      "fade, 1, 3.03, quick"
                      "layers, 1, 3.81, easeOutQuint"
                      "layersIn, 1, 4, easeOutQuint, fade"
                      "layersOut, 1, 1.5, linear, fade"
                      "fadeLayersIn, 1, 1.79, almostLinear"
                      "fadeLayersOut, 1, 1.39, almostLinear"
                      "workspaces, 1, 1.94, almostLinear, fade"
                      "workspacesIn, 1, 1.21, almostLinear, fade"
                      "workspacesOut, 1, 1.94, almostLinear, fade"
                      "zoomFactor, 1, 7, quick"
                    ];
                  };
                  dwindle = {
                    pseudotile = true;
                    preserve_split = true;
                  };
                  master = {
                    new_status = "master";
                  };
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
                    "SUPER, J, togglesplit,"
                    "SUPER, left, movefocus, l"
                    "SUPER, right, movefocus, r"
                    "SUPER, up, movefocus, u"
                    "SUPER, down, movefocus, d"
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
                    ));

                  bindel = [
                    ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
                    ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
                  ];

                  bindm = [
                    "SUPER, mouse:272, movewindow"
                    "SUPER, mouse:273, resizewindow"
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
