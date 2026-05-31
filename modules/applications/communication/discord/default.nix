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

  imports = [ ./canary.nix ];

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = [
          (pkgs.discord.override {
            withOpenASAR = true;
            withVencord = true;
          })
        ];
      };
  };
}
