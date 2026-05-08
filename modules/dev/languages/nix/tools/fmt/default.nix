{
  config,
  lib,
  username,
  ...
}:
let
  program = "fmt";
  cfg = config.modules.dev.languages.nix.tools.${program};
in
{
  options.modules.dev.languages.nix.tools.${program} = {
    enable = lib.mkEnableOption { description = "Enable nix${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [
                nixfmt
                nixfmt-tree
              ];
            };
          };
      };
    };
  };
}
