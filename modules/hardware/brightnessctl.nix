{
  config,
  lib,
  username,
  ...
}:
let
  program = "brightnessctl";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = { pkgs, ... }: { home.packages = with pkgs; [ brightnessctl ]; };
  };
}
