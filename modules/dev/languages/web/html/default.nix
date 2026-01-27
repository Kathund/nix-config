{
  config,
  lib,
  ...
}:
let
  program = "html";
  cfg = config.modules.dev.languages.web.${program};
in
{
  options.modules.dev.languages.web.${program} = {
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
              ${program} = {
                enable = true;
                extraDiagnostics = {
                  enable = true;
                  types = [ "htmlhint" ];
                };
                format = {
                  enable = true;
                  type = [ "superhtml" ];
                };
                lsp = {
                  enable = true;
                };
                treesitter = {
                  enable = true;
                  autotagHtml = true;
                };
              };
            };
          };
        };
      };
    };
  };
}
