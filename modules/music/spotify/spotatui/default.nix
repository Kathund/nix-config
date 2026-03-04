{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "spotatui";
  cfg = config.modules.music.spotify.${program};
in
{
  options.modules.music.spotify.${program} = {
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
                inputs.spotatui.packages.${pkgs.stdenv.hostPlatform.system}.default
              ];
            };
          };
      };
    };
  };
}
