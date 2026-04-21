{
  config,
  lib,
  username,
  ...
}:
let
  program = "blockbench";
  cfg = config.modules.games.minecraft.${program};
in
{
  options.modules.games.minecraft.${program} = {
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
                pkgs.blockbench
              ];
            };
          };
      };
    };
  };
}
