{
  config,
  lib,
  ...
}:
let
  service = "flaresolverr";
  cfg = config.homelab.services.${service};
  homelab = config.homelab;
in
{
  options.homelab.services.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
    configDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/${service}";
    };
    port = lib.mkOption {
      type = lib.types.port;
      default = 8080;
    };
    url = lib.mkOption {
      type = lib.types.str;
      default = "bin.${homelab.baseDomain}";
    };
    homepage.name = lib.mkOption {
      type = lib.types.str;
      default = "Deluge";
    };
    homepage.description = lib.mkOption {
      type = lib.types.str;
      default = "Cloudflare Solver";
    };
    homepage.icon = lib.mkOption {
      type = lib.types.str;
      default = "${service}.svg";
    };
    homepage.category = lib.mkOption {
      type = lib.types.str;
      default = "Services";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        port = cfg.port;
      };
    };
  };
}
