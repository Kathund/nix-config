{
  config,
  pkgs,
  lib,
  ...
}:
let
  program = "pm2";
  cfg = config.modules.homelab.${program};
in
{
  options.modules.homelab.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable { environment.systemPackages = with pkgs; [ pm2 ]; };
}
