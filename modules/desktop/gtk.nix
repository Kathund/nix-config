{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  program = "gtk";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = {
      home.pointerCursor = {
        enable = true;
        gtk.enable = true;
        x11.enable = true;
        size = 16;
        package = lib.mkIf config.modules.desktop.catppuccin.enable pkgs.catppuccin-cursors.lattePink;
        name = lib.mkIf config.modules.desktop.catppuccin.enable "Catppuccin";
      };
      gtk = {
        enable = true;
        cursorTheme = lib.mkIf config.modules.desktop.catppuccin.enable {
          package = pkgs.catppuccin-cursors.lattePink;
          name = "Catppuccin";
        };
        theme = lib.mkIf config.modules.desktop.catppuccin.enable {
          package = pkgs.catppuccin-gtk;
          name = "Catppuccin";
        };
        font = {
          name = "JetBrainsMono Nerd Font";
          size = 12;
        };
        gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
      };
    };
  };
}
