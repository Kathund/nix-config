{
  config,
  lib,
  ...
}:
let
  program = "flatpak";
  cfg = config.modules.utilities.${program};
in
{
  options.modules.utilities.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${program} = {
        enable = true;
      };
    };
  };
}
