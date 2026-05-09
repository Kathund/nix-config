{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "prism-launcher";
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
        home.packages = [ inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher ];
      };
  };
}
