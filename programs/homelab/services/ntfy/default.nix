{
  config,
  lib,
  ...
}:
let
  service = "ntfy-sh";
  cfg = config.programs.homelab.services.${service};
  homelab = config.programs.homelab;
in
{
  options.programs.homelab.services.${service} = {
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
      default = "${service}.${homelab.baseDomain}";
    };
    homepage-dashboard = {
      name = lib.mkOption {
        type = lib.types.str;
        default = service;
      };
      description = lib.mkOption {
        type = lib.types.str;
        default = "Mobile notfication tool";
      };
      category = lib.mkOption {
        type = lib.types.str;
        default = "Services";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        settings = {
          base-url = "https://${cfg.url}";
          listen-http = ":${toString cfg.port}";
          web-root = "disable";
          auth-default-access = "read-only";
        };
      };
    };
  };
}
