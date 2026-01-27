{
  config,
  lib,
  ...
}:
let
  program = "astro";
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
                  types = [ "eslint_d" ];
                };
                format = {
                  enable = true;
                  type = [ "prettier" ];
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
