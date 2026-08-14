{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "pipeweaver";
  cfg = config.modules.hardware.sound.${program};
in
{
  options.modules.hardware.sound.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  config = lib.mkIf cfg.enable { environment.systemPackages = with pkgs; [ pipeweaver ]; };
}
