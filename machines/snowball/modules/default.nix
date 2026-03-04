{
  config = {
    modules = {
      dev = {
        languages = {
          bun = {
            enable = true;
          };
          javascript = {
            enable = true;
          };
          nodejs = {
            enable = true;
          };
        };
      };
      hardware = {
        boot = {
          grub = {
            enable = true;
          };
        };
      };
      homelab = {
        services = {
          cloudflared = {
            enable = true;
            tunnel-id = "3e5ff925-bd92-4301-b336-3602fd7f0327";
          };
          mongodb = {
            enable = true;
          };
          pm2 = {
            enable = true;
          };
          redis = {
            enable = true;
          };
        };
      };
    };
  };
}
