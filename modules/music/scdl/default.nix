{
  config,
  lib,
  username,
  ...
}:
let
  program = "scdl";
  cfg = config.modules.music.${program};
in
{
  options.modules.music.${program} = {
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
                scdl
              ];
            };
          };
      };
    };
  };
}
