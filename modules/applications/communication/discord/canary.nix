{
  config,
  lib,
  username,
  ...
}:
let
  program = "canary";
  cfg = config.modules.applications.communication.discord.${program};
in
{
  options.modules.applications.communication.discord.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = [ (pkgs.discord-canary.override { withOpenASAR = true; }) ];
      };
  };
}
