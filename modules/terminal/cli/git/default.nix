{
  config,
  lib,
  username,
  ...
}:
let
  program = "git";
  cfg = config.modules.terminal.cli.${program};
in
{
  options.modules.terminal.cli.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    username = lib.mkOption {
      type = lib.types.str;
    };
    email = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          programs = {
            ${program} = {
              enable = true;
              settings = {
                user = {
                  name = cfg.username;
                  email = cfg.email;
                };
              };
            };
          };
        };
      };
    };
  };
}
