{
  config,
  lib,
  username,
  ...
}:
let
  program = "mangohud";
  cfg = config.modules.misc.games.${program};
in
{
  options.modules.misc.games.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          programs = {
            ${program} = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
