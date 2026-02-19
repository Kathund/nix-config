{
  config,
  lib,
  username,
  ...
}:
let
  program = "audacity";
  cfg = config.modules.hardware.sound.${program};
in
{
  options.modules.hardware.sound.${program} = {
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
            home = {
              packages = with pkgs; [
                audacity
              ];
            };
          };
      };
    };
  };
}
