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
    nvf = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs = lib.mkIf cfg.nvf {
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
