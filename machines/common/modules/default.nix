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
            enable = true;
          };
        };
      };
      hardware = {
        networking = {
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
          ripgrep = {
            enable = true;
          };
          starship = {
            enable = true;
          };
          zip = {
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
