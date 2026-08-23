{
  config,
  lib,
  username,
  ...
}:
let
  program = "discord";
  cfg = config.modules.applications.communication.${program};
in
{
  options.modules.applications.communication.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = { pkgs, ... }: { home.packages = with pkgs; [ discord ]; };
  };
}
