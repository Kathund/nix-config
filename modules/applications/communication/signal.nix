{
  config,
  lib,
  username,
  ...
}:
let
  program = "signal";
  cfg = config.modules.applications.communication.${program};
in
{
  options.modules.applications.communication.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ signal-desktop ];
      };
  };
}
