{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "prism-launcher";
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
                inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher
              ];
            };
          };
      };
    };
  };
}
