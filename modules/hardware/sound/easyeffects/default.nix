{
  config,
  lib,
  username,
  ...
}:
let
  program = "easyeffects";
  cfg = config.modules.hardware.sound.${program};
in
{
  options.modules.hardware.sound.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          services = {
            ${program} = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
