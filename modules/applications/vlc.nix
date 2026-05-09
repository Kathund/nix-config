{
  config,
  lib,
  username,
  ...
}:
let
  program = "vlc";
  cfg = config.modules.applications.${program};
in
{
  options.modules.applications.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ vlc ];
      };
  };
}
