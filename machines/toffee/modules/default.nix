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
        element-desktop = {
          enable = true;
        };
        signal-desktop = {
          enable = true;
        };
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
          kotlin = {
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
          blockbench = {
            enable = true;
          };
          lunar-client = {
            enable = true;
          };
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
            enable = false; # Waiting for the pkg to get updated
            loadOnStartup = false;
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
          loadWorkspaceBinds = false;
          plugins = {
            split-monitor-workspaces = {
              enable = true;
            };
          };
        };
        lock = {
          enable = true;
          lockscreen = "screenshot";
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
        kdenlive = {
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
        wayle = {
          enable = true;
          loadOnStartup = true;
        };
      };
      music = {
        scdl = {
          enable = true;
        };
        spotify = {
          spicetify = {
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
      virtualization = {
        virt = {
          enable = true;
        };
      };
    };
  };
}
