{
  config,
  lib,
  username,
  ...
}:
let
  program = "sound";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  imports = [
    ./pipeweaver.nix
  ];

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        services.playerctld.enable = true;
        home.packages = with pkgs; [ qpwgraph ];
        wayland.windowManager.hyprland.settings = {
          bindel = lib.mkIf cfg.hyprlandBind [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_SINK@ 5%-"
            "SHIFT, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+"
            "SHIFT, XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDUO_SOURCE@ 5%-"
          ];
          bindl = lib.mkIf cfg.hyprlandBind [
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
            "SHIFT, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
            ", XF86AudioNext, exec, playerctl next"
          ];
          exec-once = lib.mkIf cfg.loadOnStartup [ "qpwgraph -m" ];
        };
      };
  };
}
