{
  config,
  lib,
  ...
}:
let
  program = "redis";
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
        servers = {
          "skycrypt" = {
            enable = true;
            port = 6379;
          };
        };
      };
    };
  };
}
