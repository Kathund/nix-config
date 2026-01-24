{
  config,
  lib,
  username,
  ...
}:
let
  program = "java";
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
              java = {
                enable = true;
                lsp = {
                  enable = true;
                };
                treesitter = {
                  enable = true;
                };
              };
              kotlin = {
                enable = true;
                extraDiagnostics = {
                  enable = true;
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
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [
                zulu17
              ];
            };
          };
      };
    };
  };
}
