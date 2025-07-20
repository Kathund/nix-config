{
  config,
  lib,
  ...
}:
let
  program = "git";
  cfg = config.programs.terminal.${program};
in
{
  options.programs.terminal.${program} = {
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
    home-manager.users.kathund = {
      programs = {
        ${program} = {
          enable = true;
          userName = cfg.username;
          userEmail = cfg.email;
        };
      };
    };
  };
}
