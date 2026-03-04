{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "steam";
  cfg = config.modules.games.${program};
in
{
  options.modules.games.${program} = {
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
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
      gamemode = {
        enable = true;
      };
    };
  };
}
