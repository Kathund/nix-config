{
  config,
  lib,
  username,
  ...
}:
let
  program = "telegram-desktop";
  cfg = config.modules.communication.${program};
in
{
  options.modules.communication.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
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
                telegram-desktop
              ];
            };
          };
      };
    };
  };
}
