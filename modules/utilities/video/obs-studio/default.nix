{
  config,
  lib,
  username,
  ...
}:
let
  program = "obs-studio";
  cfg = config.modules.utilities.video.${program};
in
{
  options.modules.utilities.video.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      ${program} = {
        enable = true;
        enableVirtualCamera = true;
      };
    };
    home-manager = {
      users = {
        ${username} = {
          programs = {
            ${program} = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
