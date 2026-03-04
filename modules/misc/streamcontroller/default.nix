{
  config,
  lib,
  username,
  ...
}:
let
  program = "streamcontroller";
  cfg = config.modules.misc.${program};
in
{
  options.modules.misc.${program} = {
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
                streamcontroller
              ];
            };
            wayland = lib.mkIf cfg.loadOnStartup {
              windowManager = {
                hyprland = {
                  settings = {
                    exec-once = [ "streamcontroller -b" ];
                  };
                };
              };
            };
          };
      };
    };
  };
}
