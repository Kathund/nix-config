{
  config,
  lib,
  username,
  ...
}:
let
  program = "web";
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
              css = {
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
              html = {
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
              tailwind = {
                enable = true;
                lsp = {
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
                tailwindcss
              ];
            };
          };
      };
    };
  };
}
