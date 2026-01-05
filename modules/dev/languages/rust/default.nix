{
  config,
  lib,
  username,
  ...
}:
let
  program = "rust";
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
              rust = {
                enable = true;
                dap = {
                  enable = true;
                };
                format = {
                  enable = true;
                  type = [ "rustfmt" ];
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
                rustup
              ];
            };
          };
      };
    };
  };
}
