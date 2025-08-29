{
  config,
  lib,
  ...
}:
let
  service = "sonarr";
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
      default = "${service}.${homelab.baseDomain}";
    };
    homepage-dashboard = {
      name = lib.mkOption {
        type = lib.types.str;
        default = service;
      };
      description = lib.mkOption {
        type = lib.types.str;
        default = "TV Show collection manager";
      };
      icon = lib.mkOption {
        type = lib.types.str;
        default = "${service}.svg";
      };
      category = lib.mkOption {
        type = lib.types.str;
        default = "Arr";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        user = homelab.user;
        group = homelab.group;
        settings = {
          server = {
            port = cfg.port;
          };
        };
      };
    };
  };
}
