{
  config,
  lib,
  username,
  ...
}:
let
  program = "protonup-qt";
  cfg = config.modules.games.${program};
in
{
  options.modules.games.${program} = {
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
                protonup-qt
              ];
            };
          };
      };
    };
  };
}
