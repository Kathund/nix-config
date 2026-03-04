{
  config,
  pkgs,
  lib,
  ...
}:
let
  program = "pm2";
  cfg = config.modules.homelab.services.${program};
in
{
  options.modules.homelab.services.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        pm2
      ];
    };
  };
}
