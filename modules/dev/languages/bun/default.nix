{
  config,
  lib,
  username,
  ...
}:
let
  program = "bun";
  cfg = config.modules.dev.languages.${program};
in
{
  options.modules.dev.languages.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [
                bun
              ];
            };
          };
      };
    };
  };
}
