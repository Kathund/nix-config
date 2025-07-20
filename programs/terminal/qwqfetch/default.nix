{
  config,
  pkgs,
  lib,
  ...
}:
let
  program = "qwqfetch";
  cfg = config.programs.terminal.${program};
in
{
  options.programs.terminal.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.kathund =
      { pkgs, ... }:
      {
        programs = {
          ${program} = {
            enable = true;
          };
        };
      };
  };
}
