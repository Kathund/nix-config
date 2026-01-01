{
  config,
  lib,
  ...
}:
let
  service = "flatpak";
  cfg = config.modules.misc.${service};
in
{
  options.modules.misc.${service} = {
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
