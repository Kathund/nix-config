{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "spotify";
  cfg = config.modules.misc.${program};
in
{
  options.modules.misc.${program} = {
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
