{
  config,
  pkgs,
  lib,
  ...
}:
let
  program = "mongodb";
  cfg = config.modules.homelab.services.${program};
in
{
  options.modules.homelab.services.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ${program} = {
        enable = true;
        package = pkgs.mongodb-ce;
        bind_ip = "0.0.0.0";
      };
    };
  };
}
