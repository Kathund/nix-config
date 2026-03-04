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
      communication = {
        telegram-desktop = {
          enable = true;
        };
        vesktop = {
          enable = true;
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
          bun = {
            enable = true;
          };
          java = {
            enable = true;
          };
          javascript = {
            enable = true;
          };
          markdown = {
            enable = true;
          };
          nodejs = {
            enable = true;
          };
          python = {
            enable = true;
          };
          rust = {
            enable = true;
          };
          web = {
            astro = {
              enable = true;
            };
            css = {
              enable = true;
            };
            html = {
              enable = true;
            };
            svelte = {
              enable = true;
            };
            tailwind = {
              enable = true;
            };
          };
        };
        other = {
          mongodb-compass = {
            enable = true;
          };
        };
      };
      games = {
        mangohud = {
          enable = true;
        };
        mgba = {
          enable = true;
        };
        minecraft = {
          packwiz = {
            enable = true;
          };
          prism-launcher = {
            enable = true;
          };
        };
        protonup-qt = {
          enable = true;
        };
        steam = {
          enable = true;
        };
      };
      hardware = {
        boot = {
          sddm = {
            enable = true;
            fontSize = "16";
          };
        };
        display = {
          drivers = {
            nvidia = {
              enable = true;
            };
          };
        };
        sound = {
          enable = true;
          audacity = {
            enable = true;
          };
          pipeweaver = {
            enable = true;
            loadOnStartup = true;
          };
          playerctld = {
            enable = true;
          };
          qpwgraph = {
            enable = true;
            loadOnStartup = true;
          };
        };
      };
      homelab = {
        services = {
          pm2 = {
            enable = true;
          };
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
          loadOnStartup = true;
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
          enable = false;
          loadOnStartup = true;
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
      misc = {
        streamcontroller = {
          enable = true;
          loadOnStartup = true;
        };
      };
      music = {
        scdl = {
          enable = true;
        };
        spotify = {
          desktop = {
            enable = true;
          };
          spotatui = {
            enable = true;
          };
          spotifyd = {
            enable = true;
          };
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
      terminal = {
        cli = {
          git = {
            signCommits = true;
          };
        };
        kitty = {
          enable = true;
        };
      };
      utilities = {
        clipboard = {
          enable = true;
        };
        flatpak = {
          enable = true;
        };
        launchers = {
          rofi = {
            enable = true;
            hyprlandBind = true;
          };
        };
        video = {
          obs-studio = {
            enable = true;
          };
          vlc = {
            enable = true;
          };
        };
      };
    };
  };
}
