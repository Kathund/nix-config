{
  config,
  lib,
  ...
}:
let
  service = "deluge";
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
        default = "Torrent Client";
      };
      category = lib.mkOption {
        type = lib.types.str;
        default = "Downloads";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        user = homelab.user;
        group = homelab.group;
        web = {
          enable = true;
          port = cfg.port;
        };
      };
    };
  };
}
