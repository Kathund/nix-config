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
    terminal = {
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
  };
}
