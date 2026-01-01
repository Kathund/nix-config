{
  config,
  lib,
  ...
}:
let
  service = "microbin";
  cfg = config.modules.homelab.services.${service};
  homelab = config.modules.homelab;
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
        default = "A minimal pastebin";
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
          MICROBIN_WIDE = true;
          MICROBIN_PUBLIC_PATH = "https://${cfg.url}/";
          MICROBIN_BIND = "127.0.0.1";
          MICROBIN_PORT = cfg.port;
          MICROBIN_HIDE_LOGO = true;
          MICROBIN_HIDE_FOOTER = true;
          MICROBIN_HIDE_HEADER = true;
          MICROBIN_DISABLE_TELEMETRY = true;
          MICROBIN_SHOW_READ_STATS = true;
          MICROBIN_EDITABLE = false;
          MICROBIN_ENABLE_BURN_AFTER = true;
          MICROBIN_ETERNAL_PASTA = true;
          MICROBIN_DEFAULT_EXPIRY = "1week";
          MICROBIN_PRIVATE = false;
          MICROBIN_HIGHLIGHTSYNTAX = true;
        };
      };
    };
  };
}
