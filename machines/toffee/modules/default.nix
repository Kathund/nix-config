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
        };
      };
      dev = {
        nix = {
          enable = true;
        };
        nodejs = {
          enable = true;
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
          gh = {
            enable = true;
          };
          git = {
            enable = true;
          };
          hyfetch = {
            enable = true;
            brightness = 0.50;
            backend = "fastfetch";
            preset = "bisexual";
          };
          lazygit = {
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
