{
  config,
  lib,
  username,
  ...
}:
let
  program = "mangohud";
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
