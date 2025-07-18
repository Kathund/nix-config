{
  config,
  pkgs,
  lib,
  ...
}:
let
  program = "nodejs";
  cfg = config.programs.dev.${program};
in
{
  options.programs.dev.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nodejs_22
    ];
  };
}
