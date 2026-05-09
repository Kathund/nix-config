{
  config.modules = {
    dev = {
      bun.enable = true;
      javascript.enable = true;
      nodejs.enable = true;
    };
    hardware.grub = {
      enable = true;
      device = "/dev/sda";
    };
    homelab = {
      cloudflared = {
        enable = true;
        tunnel-id = "3e5ff925-bd92-4301-b336-3602fd7f0327";
      };
      mongodb.enable = true;
      pm2.enable = true;
      qbittorrent = {
        enable = true;
        port = 6625;
      };
    };
  };
}
