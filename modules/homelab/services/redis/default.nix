{
  config,
  lib,
  ...
}:
let
  service = "redis";
  cfg = config.modules.homelab.services.${service};
in
{
  options.modules.homelab.services.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        servers = {
          "skycrypt" = {
            enable = true;
            port = 6379;
          };
        };
      };
    };
  };
}
