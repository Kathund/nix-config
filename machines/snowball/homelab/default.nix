{
  config,
  inputs,
  pkgs,
  ...
}:
{
  config.homelab = {
    enable = true;
    baseDomain = "kath.lol";
    services = {
      cloudflared = {
        enable = true;
        tunnel-id = "3e5ff925-bd92-4301-b336-3602fd7f0327";
      };
      microbin = {
        enable = true;
        port = 24572;
      };
      ntfy-sh = {
        enable = true;
        port = 25472;
      };
      uptime-kuma = {
        enable = true;
        port = 3001;
      };
    };
  };
}
