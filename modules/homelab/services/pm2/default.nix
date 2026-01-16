{
  config,
  pkgs,
  lib,
  ...
}:
let
  service = "pm2";
  cfg = config.modules.homelab.services.${service};
in
{
  options.modules.homelab.services.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
    tunnel-id = lib.mkOption {
      type = lib.types.str;
      default = "00000000-0000-0000-0000-000000000000";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pm2
    ];
  };
}
