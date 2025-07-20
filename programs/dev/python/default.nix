{
  config,
  lib,
  ...
}:
let
  program = "python";
  cfg = config.programs.dev.${program};
in
{
  options.programs.dev.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.kathund =
      { pkgs, ... }:
      {
        home = {
          packages = with pkgs; [
            python312
          ];
        };
      };
  };
}
