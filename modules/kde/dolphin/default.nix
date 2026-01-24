{
  config,
  lib,
  username,
  ...
}:
let
  program = "dolphin";
  cfg = config.modules.kde.${program};
in
{
  options.modules.kde.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      udisks2 = {
        enable = true;
      };
    };
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [
                kdePackages.qtsvg
                kdePackages.kio
                kdePackages.kio-fuse
                kdePackages.kio-extras
                kdePackages.dolphin
                kdePackages.dolphin-plugins
              ];
            };
            wayland = {
              windowManager = {
                hyprland = {
                  settings = {
                    bind = [ "SUPER, E, exec, ${program}" ];
                  };
                };
              };
            };
          };
      };
    };
  };
}
