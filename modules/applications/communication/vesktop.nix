{
  config,
  lib,
  username,
  ...
}:
let
  program = "vesktop";
  cfg = config.modules.applications.communication.${program};
in
{
  options.modules.applications.communication.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.${program}.enable = true;
      catppuccin.${program}.enable = false;
    };
  };
}
