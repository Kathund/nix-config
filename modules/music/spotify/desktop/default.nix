{
  config,
  lib,
  username,
  ...
}:
let
  program = "desktop";
  cfg = config.modules.music.spotify.${program};
in
{
  options.modules.music.spotify.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable spotify ${program}";
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
                spotify
              ];
            };
          };
      };
    };
  };
}
