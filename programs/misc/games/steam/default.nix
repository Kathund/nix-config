{
  config,
  lib,
  ...
}:
let
  program = "steam";
  cfg = config.programs.misc.games.${program};
in
{
  options.programs.misc.games.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      ${program} = {
        enable = true;
        remotePlay = {
          openFirewall = true;
        };
        dedicatedServer = {
          openFirewall = true;
        };
      };
      gamemode = {
        enable = true;
      };
    };
  };
}
