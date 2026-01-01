{
  config,
  lib,
  username,
  ...
}:
let
  program = "vesktop";
  cfg = config.modules.misc.${program};
in
{
  options.modules.misc.${program} = {
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
