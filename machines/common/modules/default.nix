{
  config = {
    modules = {
      dev = {
        languages = {
          c = {
            enable = true;
          };
          nix = {
            enable = true;
          };
        };
        editors = {
          nvf = {
            enable = true;
          };
        };
      };
      terminal = {
        cli = {
          gh = {
            enable = true;
          };
          git = {
            enable = true;
            username = "Jacob";
            email = "kathund@proton.me";
          };
          ripgrep = {
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
