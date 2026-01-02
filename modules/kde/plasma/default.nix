{
  config,
  lib,
  ...
}:
let
  program = "plasma";
  cfg = config.modules.kde.${program};
in
{
  options.modules.kde.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
      };
      desktopManager = {
        plasma6 = {
          enable = true;
        };
      };
    };
  };
}
