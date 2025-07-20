{
  config.programs = {
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
      git = {
        username = "Jacob";
        email = "admin@kath.lol";
      };
    };
  };
}
