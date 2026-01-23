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
  };

  config = lib.mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        pm2
      ];
    };
  };
}
