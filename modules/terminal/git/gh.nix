{
  config,
  lib,
  username,
  ...
}:
let
  program = "gh";
  cfg = config.modules.terminal.git.${program};
in
{
  options.modules.terminal.git.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable { home-manager.users.${username}.programs.${program}.enable = true; };
}
