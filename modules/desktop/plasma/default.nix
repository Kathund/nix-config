{ config, lib, ... }:
let
  program = "plasma";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    services = {
      xserver.enable = true;
      desktopManager.plasma6.enable = true;
    };
  };
}
