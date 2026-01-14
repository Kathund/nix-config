{
  config,
  lib,
  pkgs,
  ...
}:
let
  service = "mongodb";
  cfg = config.modules.homelab.services.${service};
in
{
  options.modules.homelab.services.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
    configDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/${service}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        package = pkgs.mongodb-ce;
        bind_ip = "0.0.0.0";
      };
    };
  };
}
