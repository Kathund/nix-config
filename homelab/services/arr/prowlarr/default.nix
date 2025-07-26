{
  config,
  lib,
  ...
}:
let
  service = "prowlarr";
  cfg = config.homelab.services.arr.${service};
  homelab = config.homelab;
in
{
  options.homelab.services.arr.${service} = {
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
    homepage.name = lib.mkOption {
      type = lib.types.str;
      default = "Prowlarr";
    };
    homepage.description = lib.mkOption {
      type = lib.types.str;
      default = "PVR indexer";
    };
    homepage.icon = lib.mkOption {
      type = lib.types.str;
      default = "${service}.svg";
    };
    homepage.category = lib.mkOption {
      type = lib.types.str;
      default = "Arr";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        settings = {
          server = {
            port = cfg.port;
          };
        };
      };
    };
  };
}
