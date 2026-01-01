{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  program = "ark";
  cfg = config.programs.kde.${program};
in
{
  options.programs.kde.${program} = {
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
