{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  program = "sound";
  cfg = config.programs.hardware.${program};
in
{
  options.programs.hardware.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      playerctl
      qpwgraph
    ];
    services = {
      pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        pulse = {
          enable = true;
        };
        wireplumber = {
          enable = true;
        };
      };
      pulseaudio = {
        enable = false;
      };
    };
    home-manager = {
      users = {
        ${username} = {
          programs = {
            hyprpanel = {
              settings = {
                theme = {
                  osd = {
                    muted_zero = true;
                  };
                };
                bar = {
                  layouts = {
                    "*" = {
                      middle = [ "media" ];
                      right = [ "volume" ];
                    };
                  };
                  media = {
                    show_active_only = true;
                  };
                };
                menus = {
                  volume = {
                    raiseMaximumVolume = true;
                  };
                };
              };
            };
          };
          wayland = {
            windowManager = {
              hyprland = {
                settings = {
                  bindel = [
                    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_SINK@ 5%+"
                    ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_SINK@ 5%-"
                    "SHIFT, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+"
                    "SHIFT, XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDUO_SOURCE@ 5%-"
                  ];
                  bindl = [
                    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
                    "SHIFT, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                    ", XF86AudioPlay, exec, playerctl play-pause"
                    ", XF86AudioPrev, exec, playerctl previous"
                    ", XF86AudioNext, exec, playerctl next"
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
