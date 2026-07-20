{
  config,
  lib,
  username,
  ...
}:
let
  program = "celeste";
  cfg = config.modules.applications.games.${program};
in
{
  options.modules.applications.games.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ (olympus.override { celesteWrapper = "steam-run"; }) ];
      };
  };
}
