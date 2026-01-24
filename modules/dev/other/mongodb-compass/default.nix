{
  config,
  lib,
  username,
  ...
}:
let
  program = "mongodb-compass";
  cfg = config.modules.dev.other.${program};
in
{
  options.modules.dev.other.${program} = {
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
                mongodb-compass
              ];
            };
          };
      };
    };
  };
}
