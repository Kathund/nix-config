{
  config,
  inputs,
  lib,
  username,
  ...
}:
let
  program = "dix";
  cfg = config.modules.dev.languages.nix.tools.${program};
in
{
  options.modules.dev.languages.nix.tools.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable nix${program}";
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
                inputs.dix.packages.${pkgs.stdenv.hostPlatform.system}.default
              ];
            };
            programs = {
              zsh = {
                shellAliases = {
                  dix-latest = "${config.modules.configPath}/modules/dev/languages/nix/tools/${program}/dix-latest.sh";
                };
              };
            };
          };
      };
    };
  };
}
