{
  config.programs = {
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
      };
      paper = {
        enable = true;
      };
      shot = {
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
          brightness = 0.82;
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
}
