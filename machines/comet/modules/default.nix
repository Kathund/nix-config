{
  config = {
    modules = {
      browsers = {
        librewolf = {
          enable = true;
          hyprlandBind = true;
        };
      };
      dev = {
        languages = {
          nodejs = {
            enable = true;
          };
        };
      };
      hardware = {
        sddm = {
          enable = true;
        };
        sound = {
          enable = true;
        };
      };
      hypr = {
        idle = {
          enable = true;
        };
        land = {
          enable = true;
        };
        lock = {
          enable = true;
          lockscreen = "screenshot";
        };
        panel = {
          enable = true;
        };
        paper = {
          enable = true;
        };
        shot = {
          enable = true;
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
      misc = {
        rofi = {
          enable = true;
        };
        spotify = {
          enable = true;
        };
        vesktop = {
          enable = true;
        };
      };
      styles = {
        catppuccin = {
          enable = true;
        };
        fonts = {
          enable = true;
        };
        gtk = {
          enable = true;
        };
      };
    };
  };
}
