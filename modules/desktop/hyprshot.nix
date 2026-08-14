{
  config,
  lib,
  username,
  ...
}:
let
  program = "hyprshot";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = { pkgs, ... }: { home.packages = with pkgs; [ hyprshot ]; };
  };
}
