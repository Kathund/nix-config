{
  config,
  lib,
  username,
  ...
}:
let
  program = "cliphist";
  cfg = config.modules.misc.${program};
in
{
  options.modules.misc.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [
                wl-clipboard
              ];
            };
            services = {
              "${program}" = {
                enable = true;
                allowImages = true;
                clipboardPackage = pkgs.wl-clipboard;
              };
            };
            wayland = {
              windowManager = {
                hyprland = {
                  settings = {
                    bind = [
                      "SUPER_SHIFT, V, exec, cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"
                    ];
                    exec-once = [
                      "wl-paste --type text --watch cliphist store"
                      "wl-paste --type image --watch cliphist store"
                    ];
                  };
                };
              };
            };
          };
      };
    };
  };
}
