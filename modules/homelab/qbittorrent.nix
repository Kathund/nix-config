{ config, lib, ... }:
let
  program = "qbittorrent";
  cfg = config.modules.homelab.${program};
in
{
  options.modules.homelab.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    port = lib.mkOption {
      type = lib.types.port;
      default = 8080;
    };
  };

  config = lib.mkIf cfg.enable {
    services.${program} = {
      enable = true;
      openFirewall = true;
      webuiPort = cfg.port;
    };
  };
}
