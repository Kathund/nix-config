{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "spotify";
  cfg = config.programs.misc.${program};
in
{
  options.programs.misc.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      spotify
    ];
  };
}
