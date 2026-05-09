{
  config,
  lib,
  username,
  ...
}:
let
  program = "ripgrep";
  cfg = config.modules.terminal.${program};
in
{
  options.modules.terminal.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable { home-manager.users.${username}.programs.${program}.enable = true; };
}
