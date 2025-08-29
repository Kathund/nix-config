{
  config.homelab = {
    enable = true;
    baseDomain = "kath.lol";
    services = {
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
      cloudflared = {
        enable = true;
        tunnel-id = "3e5ff925-bd92-4301-b336-3602fd7f0327";
      };
      deluge = {
        enable = true;
        port = 24575;
      };
      homepage-dashboard = {
        enable = true;
        port = 24576;
        url = "homepage.kath.lol";
      };
      microbin = {
        enable = true;
        port = 24577;
        url = "bin.kath.lol";
      };
      ntfy-sh = {
        enable = true;
        port = 24578;
        url = "ntfy.kath.lol";
      };
      uptime-kuma = {
        enable = true;
        port = 3001;
        url = "status.kath.lol";
      };
    };
  };
}
