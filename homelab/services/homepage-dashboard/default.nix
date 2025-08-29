{
  config,
  lib,
  ...
}:
let
  service = "homepage-dashboard";
  cfg = config.homelab.services.${service};
  homelab = config.homelab;
in
{
  options.homelab.services.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
    port = lib.mkOption {
      type = lib.types.port;
      default = 8080;
    };
    url = lib.mkOption {
      type = lib.types.str;
      default = "${service}.${homelab.baseDomain}";
    };
    misc = lib.mkOption {
      default = [ ];
      type = lib.types.listOf (
        lib.types.attrsOf (
          lib.types.submodule {
            options = {
              description = lib.mkOption {
                type = lib.types.str;
              };
              href = lib.mkOption {
                type = lib.types.str;
              };
            };
          }
        )
      );
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        listenPort = cfg.port;
        allowedHosts = "localhost:${toString cfg.port},127.0.0.1:${toString cfg.port},${cfg.url}";
        settings = {
          layout = [
            {
              Arr = {
                header = true;
                style = "column";
              };
            }
            {
              Downloads = {
                header = true;
                style = "column";
              };
            }
            {
              Services = {
                header = true;
                style = "column";
              };
            }
          ];
        };
        services =
          let
            homepage-dashboardCategories = [
              "Arr"
              "Downloads"
              "Services"
            ];
            hl = config.homelab.services;
            homepage-dsahboardServices =
              x:
              (lib.attrsets.filterAttrs (
                name: value: value ? homepage-dashboard && value.homepage-dashboard.category == x
              ) homelab.services);
          in
          lib.lists.forEach homepage-dashboardCategories (cat: {
            "${cat}" =
              lib.lists.forEach
                (lib.attrsets.mapAttrsToList (name: value: name) (homepage-dsahboardServices "${cat}"))
                (x: {
                  "${hl.${x}.homepage-dashboard.name}" = {
                    description = hl.${x}.homepage-dashboard.description;
                    href = "https://${hl.${x}.url}";
                    siteMonitor = "https://${hl.${x}.url}";
                  };
                });
          })
          ++ [ { Misc = cfg.misc; } ];
      };
    };
  };
}
