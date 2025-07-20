{
  config,
  lib,
  ...
}:
let
  service = "ntfy-sh";
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
      default = "/var/lib/ntfy-sh";
    };
    port = lib.mkOption {
      type = lib.types.port;
      default = 8080;
    };
    url = lib.mkOption {
      type = lib.types.str;
      default = "ntfy.${homelab.baseDomain}";
    };
    homepage.name = lib.mkOption {
      type = lib.types.str;
      default = "ntfy";
    };
    homepage.description = lib.mkOption {
      type = lib.types.str;
      default = "Mobile notfication tool";
    };
    homepage.icon = lib.mkOption {
      type = lib.types.str;
      default = "ntfy.svg";
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
