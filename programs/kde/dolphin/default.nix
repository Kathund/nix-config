{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  program = "dolphin";
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
              kdePackages.qtsvg
              kdePackages.kio
              kdePackages.kio-fuse
              kdePackages.kio-extras
              kdePackages.dolphin
            ];
          };
      };
    };
  };
}
