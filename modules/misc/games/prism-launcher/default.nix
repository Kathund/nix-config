{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "prism-launcher";
  cfg = config.modules.misc.games.${program};
in
{
  options.modules.misc.games.${program} = {
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
              inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
            ];
          };
      };
    };
  };
}
