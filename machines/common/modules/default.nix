{
  config = {
    modules = {
      dev = {
        editors = {
          nvf = {
            enable = true;
          };
        };
        languages = {
          c = {
            enable = true;
          };
          nix = {
            tools = {
              dix = {
                enable = true;
              };
              fmt = {
                enable = true;
              };
              nixmate = {
                enable = true;
              };
            };
            enable = true;
          };
        };
      };
      hardware = {
        networking = {
          enable = true;
        };
      };
      styles = {
        catppuccin = {
          enable = true;
        };
      };
      terminal = {
        cli = {
          btop = {
            enable = true;
          };
          fastfetch = {
            enable = true;
          };
          fzf = {
            enable = true;
          };
          git = {
            enable = true;
            username = "Jacob";
            email = "kathund@proton.me";
            gh = {
              enable = true;
            };
            lazygit = {
              enable = true;
            };
          };
          htop = {
            enable = true;
          };
          hyfetch = {
            enable = true;
            brightness = 0.50;
            backend = "fastfetch";
            preset = "bisexual";
          };
          jq = {
            enable = true;
          };
          ncdu = {
            enable = true;
          };
          ripgrep = {
            enable = true;
          };
          starship = {
            enable = true;
          };
          tree = {
            enable = true;
          };
          wget = {
            enable = true;
          };
          zip = {
            enable = true;
          };
          zsh = {
            enable = true;
          };
        };
        kitty = {
          enable = true;
        };
      };
    };
  };
}
