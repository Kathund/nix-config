{
  config,
  lib,
  username,
  ...
}:
let
  program = "streamcontroller";
  cfg = config.modules.applications.${program};
in
{
  options.modules.applications.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ streamcontroller ];
        wayland.windowManager.hyprland.settings.exec-once = lib.mkIf cfg.loadOnStartup [ "${program} -b" ];
      };
  };
}
