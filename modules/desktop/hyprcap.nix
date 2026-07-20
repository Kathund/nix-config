{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "hyprcap";
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
        home.packages = [ inputs.hyprcap.packages.${pkgs.stdenv.hostPlatform.system}.default ];
        wayland.windowManager.hyprland.settings.bind = lib.mkIf cfg.hyprlandBind [
          ", PRINT, exec, ${program} shot region --freeze --copy --notify"
        ];
      };
  };
}
