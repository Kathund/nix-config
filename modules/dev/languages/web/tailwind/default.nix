{
  config,
  lib,
  username,
  ...
}:
let
  program = "tailwind";
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
