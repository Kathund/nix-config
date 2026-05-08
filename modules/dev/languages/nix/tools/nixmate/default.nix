{
  config,
  inputs,
  lib,
  username,
  ...
}:
let
  program = "nixmate";
  cfg = config.modules.dev.languages.nix.tools.${program};
in
{
  options.modules.dev.languages.nix.tools.${program} = {
    enable = lib.mkEnableOption { description = "Enable nix${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [ inputs.nixmate.packages.${pkgs.stdenv.hostPlatform.system}.default ];
            };
          };
      };
    };
  };
}
