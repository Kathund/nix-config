{
  config.homelab = {
    enable = true;
    baseDomain = "kath.lol";
    services = {
      arr = {
        bazarr = {
          enable = true;
          port = 24570;
        };
        lidarr = {
          enable = true;
          port = 24571;
        };
        prowlarr = {
          enable = true;
          port = 24572;
        };
        radarr = {
          enable = true;
          port = 24573;
        };
        sonarr = {
          enable = true;
          port = 24574;
        };
      };
      cloudflared = {
        enable = true;
        tunnel-id = "3e5ff925-bd92-4301-b336-3602fd7f0327";
      };
      deluge = {
        enable = true;
        port = 24575;
      };
      flaresolverr = {
        enable = true;
        port = 24576;
      };
      microbin = {
        enable = true;
        port = 24577;
      };
      ntfy-sh = {
        enable = true;
        port = 24578;
      };
      uptime-kuma = {
        enable = true;
        port = 3001;
      };
    };
  };
}
