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
  };

  config = lib.mkIf cfg.enable {
    programs = {
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
