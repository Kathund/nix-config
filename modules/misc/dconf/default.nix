{
  config,
  lib,
  ...
}:
let
  program = "dconf";
  cfg = config.modules.misc.${program};
in
{
  options.modules.misc.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      ${program} = {
        enable = true;
      };
    };
  };
}
