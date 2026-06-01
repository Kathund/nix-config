{
  config.modules = {
    dev = {
      bun.enable = true;
      javascript.enable = true;
      nodejs.enable = true;
    };
    dev.python.enable = true;
    hardware.grub = {
      enable = true;
      device = "/dev/sda";
    };
    homelab = {
      mongodb.enable = true;
      pm2.enable = true;
      qbittorrent = {
        enable = true;
        port = 6625;
      };
    };
  };
}
