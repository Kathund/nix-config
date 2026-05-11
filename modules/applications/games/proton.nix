{
  config,
  lib,
  username,
  ...
}:
let
  program = "proton";
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
        home.packages = with pkgs; [
          protonup-qt
          winetricks
          protontricks
        ];
      };
  };
}
