{
  config = {
    modules = {
      hardware = {
        grub = {
          enable = true;
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
      dev = {
        languages = {
          nodejs = {
            enable = true;
          };
        };
      };
      terminal = {
        kitty = {
          enable = true;
        };
        cli = {
          fastfetch = {
            enable = true;
          };
          fzf = {
            enable = true;
          };
          starship = {
            enable = true;
          };
          zsh = {
            enable = true;
          };
        };
      };
    };
  };
}
