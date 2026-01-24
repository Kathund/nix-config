{
  config,
  lib,
  username,
  ...
}:
let
  program = "idea";
  cfg = config.modules.dev.editors.jetbrains.${program};
in
{
  options.modules.dev.editors.jetbrains.${program} = {
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
                jetbrains.idea-oss
              ];
            };
          };
      };
    };
  };
}
