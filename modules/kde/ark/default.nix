{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  program = "ark";
  cfg = config.modules.kde.${program};
in
{
  options.modules.kde.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home.packages = with pkgs; [
              kdePackages.ark
            ];
          };
      };
    };
  };
}
