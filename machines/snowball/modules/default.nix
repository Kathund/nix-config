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
          mongodb = {
            enable = true;
          };
          pm2 = {
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
