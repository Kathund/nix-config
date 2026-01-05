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
            email = "admin@kath.lol";
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
    };
  };
}
