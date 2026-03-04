{
  config,
  lib,
  ...
}:
let
  service = "flatpak";
  cfg = config.modules.utilities.${service};
in
{
  options.modules.utilities.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
      };
    };
  };
}
