{
  config,
  lib,
  ...
}:
let
  program = "neofetch";
  cfg = config.programs.terminal.${program};
in
{
  options.programs.terminal.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.kathund = {
      programs = {
        ${program} = {
          enable = true;
        };
      };
    };
  };
}
