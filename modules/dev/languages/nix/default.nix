{
  config,
  inputs,
  lib,
  username,
  ...
}:
let
  program = "nix";
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
              nix = {
                enable = true;
                format = {
                  enable = true;
                  type = [ "nixfmt" ];
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
            programs = {
              nix-your-shell = {
                enable = true;
              };
              nix-index = {
                enable = true;
              };
            };
            home = {
              packages = with pkgs; [
                nixfmt-rfc-style
                nixfmt-tree
                nixd
                compose2nix
              ];
            };
            nix = {
              nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
            };
          };
      };
    };
  };
}
