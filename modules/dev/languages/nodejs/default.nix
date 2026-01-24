{
  config,
  lib,
  username,
  ...
}:
let
  program = "nodejs";
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
              ts = {
                enable = true;
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
                extensions = {
                  ts-error-translator = {
                    enable = true;
                  };
                };
                extraDiagnostics = {
                  enable = true;
                  types = [ "eslint_d" ];
                };
              };
              json = {
                enable = true;
                format = {
                  enable = true;
                  type = [ "jsonfmt" ];
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
                nodejs_24
                pnpm
                prettier
                eslint
                tsx
                typescript
              ];
            };
          };
      };
    };
  };
}
