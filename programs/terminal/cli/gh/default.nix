{
  config,
  lib,
  username,
  ...
}:
let
  program = "gh";
  cfg = config.programs.terminal.cli.${program};
in
{
  options.programs.terminal.cli.${program} = {
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
