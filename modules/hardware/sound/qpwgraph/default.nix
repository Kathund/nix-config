{
  config,
  lib,
  username,
  ...
}:
let
  program = "qpwgraph";
  cfg = config.modules.hardware.sound.${program};
in
{
  options.modules.hardware.sound.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = false;
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
                qpwgraph
              ];
            };
            wayland = lib.mkIf cfg.loadOnStartup {
              windowManager = {
                hyprland = {
                  settings = {
                    exec-once = [ "qpwgraph -m" ];
                  };
                };
              };
            };
          };
      };
    };
  };
}
