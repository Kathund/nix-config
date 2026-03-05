{
  config,
  inputs,
  lib,
  username,
  ...
}:
let
  program = "mate";
  cfg = config.modules.dev.languages.nix.${program};
in
{
  options.modules.dev.languages.nix.${program} = {
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
                inputs.nixmate.packages.${pkgs.stdenv.hostPlatform.system}.default
              ];
            };
          };
      };
    };
  };
}
