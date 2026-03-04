{
  config,
  lib,
  username,
  machine,
  pkgs,
  ...
}:
let
  program = "spotifyd";
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
        ${username} = {
          services = {
            ${program} = {
              enable = true;
              package = pkgs.spotifyd.override {
                withMpris = true;
              };
              settings = {
                global = {
                  device_name = machine;
                  device_type = "speaker";
                  cache_path = "/home/${username}/.cache/${program}";
                  use_mpris = true;
                  disable_discovery = true;
                  bitrate = 320;
                  initial_volume = 50;
                  volume_normalisation = true;
                  normalisation_pregain = -10;
                  autoplay = false;
                };
              };
            };
          };
        };
      };
    };
  };
}
