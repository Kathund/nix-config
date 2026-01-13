{
  config,
  inputs,
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
  };

  config = lib.mkIf cfg.enable {
    programs = {
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
