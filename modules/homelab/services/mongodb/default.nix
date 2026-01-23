{
  config,
  pkgs,
  lib,
  ...
}:
let
  service = "mongodb";
  cfg = config.modules.homelab.services.${service};
in
{
  options.modules.homelab.services.${service} = {
    enable = lib.mkEnableOption {
      description = "Enable ${service}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${service} = {
        enable = true;
        package = pkgs.mongodb-ce;
        bind_ip = "0.0.0.0";
      };
    };
  };
}
