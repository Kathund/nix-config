{
  config,
  lib,
  username,
  ...
}:
let
  program = "dolphin";
  cfg = config.modules.applications.${program};
in
{
  options.modules.applications.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    services.udisks2.enable = true;
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          kdePackages.qtsvg
          kdePackages.kio
          kdePackages.kio-fuse
          kdePackages.kio-extras
          kdePackages.dolphin
          kdePackages.dolphin-plugins
        ];
        wayland.windowManager.hyprland.settings.bind = lib.mkIf cfg.hyprlandBind [
          "SUPER, E, exec, ${program}"
        ];
      };
  };
}
