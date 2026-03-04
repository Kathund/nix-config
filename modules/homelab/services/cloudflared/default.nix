{
  config,
  pkgs,
  lib,
  username,
  ...
}:
let
  program = "cloudflared";
  cfg = config.modules.homelab.services.${program};
in
{
  options.modules.homelab.services.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    tunnel-id = lib.mkOption {
      type = lib.types.str;
      default = "00000000-0000-0000-0000-000000000000";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cloudflared
    ];

    services = {
      ${program} = {
        enable = true;
        tunnels = {
          ${cfg.tunnel-id} = {
            credentialsFile = "/home/${username}/.cloudflared/${cfg.tunnel-id}.json";
            default = "http_status:404";
          };
        };
      };
    };
  };
}
