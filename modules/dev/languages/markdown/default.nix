{
  config,
  lib,
  ...
}:
let
  program = "markdown";
  cfg = config.modules.dev.languages.${program};
in
{
  options.modules.dev.languages.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      nvf = {
        settings = {
          vim = {
            languages = {
              markdown = {
                enable = true;
                extensions = {
                  markview-nvim = {
                    enable = true;
                  };
                };
                extraDiagnostics = {
                  enable = true;
                };
                format = {
                  enable = true;
                  type = [ "prettierd" ];
                };
                lsp = {
                  enable = true;
                };
                treesitter = {
                  enable = true;
                };
              };
            };
          };
        };
      };
    };
  };
}
