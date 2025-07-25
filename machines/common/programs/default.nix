{
  config.programs = {
    hardware = {
      grub = {
        enable = true;
      };
    };
    editors = {
      nvf = {
        enable = true;
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;
        };
      };
    };
    terminal = {
      cli = {
        git = {
          username = "Jacob";
          email = "admin@kath.lol";
        };
      };
    };
  };
}
