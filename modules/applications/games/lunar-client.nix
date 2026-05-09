{
  config,
  lib,
  username,
  ...
}:
let
  program = "lunar-client";
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
        home.packages = with pkgs; [ lunar-client ];
      };
  };
}
