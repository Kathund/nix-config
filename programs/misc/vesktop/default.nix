{
  config,
  lib,
  username,
  ...
}:
let
  program = "vesktop";
  cfg = config.programs.misc.${program};
in
{
  options.programs.misc.${program} = {
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
