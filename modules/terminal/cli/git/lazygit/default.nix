{
  config,
  lib,
  username,
  ...
}:
let
  program = "lazygit";
  cfg = config.modules.terminal.cli.git.${program};
in
{
  options.modules.terminal.cli.git.${program} = {
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
              enableZshIntegration = true;
            };
          };
        };
      };
    };
  };
}
