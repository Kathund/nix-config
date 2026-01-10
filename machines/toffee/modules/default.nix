{
  username,
  ...
}:
{
  config = {
    modules = {
      configPath = "/home/${username}/github/nix-config";
      browsers = {
        chromium = {
          enable = true;
        };
        firefox = {
          enable = true;
        };
        librewolf = {
          enable = true;
          hyprlandBind = true;
          setDefault = true;
        };
      };
      dev = {
        editors = {
          jetbrains = {
            idea = {
              enable = true;
            };
          };
        };
        languages = {
          nodejs = {
            enable = true;
          };
          json = {
            enable = true;
          };
          rust = {
            enable = true;
          };
        };
        other = {
          mongodb-compass = {
            enable = true;
          };
        };
      };
      hardware = {
        drivers = {
          nvidia = {
            enable = true;
          };
        };
        sddm = {
          enable = true;
          fontSize = "16";
        };
        sound = {
          enable = true;
        };
        grub = {
          enable = false;
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
          bar = {
            transparent = true;
            location = "top";
          };
          osd = {
            location = "top";
          };
          font = {
            size = "14px";
          };
        };
        paper = {
          enable = true;
        };
        shot = {
          enable = true;
        };
      };
      kde = {
        ark = {
          enable = true;
        };
        dolphin = {
          enable = true;
        };
        gwenview = {
          enable = true;
        };
        kate = {
          enable = true;
        };
        krita = {
          enable = true;
        };
        plasma = {
          enable = true;
        };
      };
      styles = {
        fonts = {
          enable = true;
        };
        gtk = {
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
        cliphist = {
          enable = true;
        };
        flatpak = {
          enable = true;
        };
        games = {
          prism-launcher = {
            enable = true;
          };
          steam = {
            enable = true;
          };
        };
        obs-studio = {
          enable = true;
        };
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
    };
  };
}
