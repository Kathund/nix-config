{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.homelab.services = {
    enable = lib.mkEnableOption "Settings and services for the homelab";
  };

  config = lib.mkIf config.homelab.services.enable {
    networking.firewall.enable = true;
  };

  imports = [
    ./cloudflared
    ./microbin
    ./uptime-kuma
  ];
}
