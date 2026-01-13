{
  config = {
    modules = {
      hardware = {
        grub = {
          enable = true;
        };
      };
      homelab = {
        enable = true;
        baseDomain = "kath.lol";
        services = {
          mongodb = {
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
