{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  program = "gtk";
  cfg = config.modules.styles.${program};
in
{
  options.modules.styles.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          home = {
            pointerCursor = {
              gtk = {
                enable = true;
              };
              x11 = {
                enable = true;
              };
              package = pkgs.catppuccin-cursors.mochaPink;
              name = "Catppuccin";
              size = 16;
            };
          };
          gtk = {
            enable = true;
            cursorTheme = {
              package = pkgs.catppuccin-cursors.mochaPink;
              name = "Catppuccin";
            };
            theme = {
              package = pkgs.catppuccin-gtk;
              name = "Catppuccin";
            };
            font = {
              name = "JetBrainsMono Nerd Font";
              size = 12;
            };
            gtk3 = {
              extraConfig = {
                gtk-application-prefer-dark-theme = 1;
              };
            };
            gtk4 = {
              extraConfig = {
                gtk-application-prefer-dark-theme = 1;
              };
            };
          };
        };
      };
    };
  };
}
