{
  config,
  pkgs,
  lib,
  ...
}:
let
  service = "cloudflared";
  cfg = config.homelab.services.${service};
  homelab = config.homelab;
in
{
  options.homelab.services.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
    tunnel-id = lib.mkOption {
      type = lib.types.str;
      default = "00000000-0000-0000-0000-000000000000";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
	tunnels = {
          ${cfg.tunnel-id} = {
            credentialsFile = "/home/kathund/.cloudflared/${cfg.tunnel-id}.json";
            default = "http_status:404";
          };
        };
      };
    };
  };
}
