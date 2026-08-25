{
  config,
  lib,
  username,
  ...
}:
let
  program = "wayle";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username}.services.${program} = {
      enable = true;
      settings = {
        bar = {
          location = "bottom";
          scale = 0.65;
          layout = {
            monitor = "*";
            show = true;
            left = [
              "hyprland-workspaces"
              "media"
            ];
            right = [
              "microphone"
              "volume"
              "systray"
              "clock"
              "notifications"
            ];
          };
        };
        general = {
          font-mono = "JetBrainsMono Nerd Font Mono";
          font-sans = "JetBrainsMono Nerd Font Mono";
        };
        modules = {
          clock = {
            dropdown-show-seconds = true;
            format = "%y:%m:%d %H:%M:%S";
            icon-show = false;
            label-color = "red";
          };
          hyprland-workspaces = {
            active-color = "red";
            active-indicator = "underline";
            occupied-color = "red";
          };
          media = {
            icon-bg-color = "transparent";
            icon-color = "blue";
            players-ignored = [ "*playerctld" ];
          };
          microphone = {
            icon-bg-color = "transparent";
            icon-color = "red";
          };
          notification = {
            icon-bg-color = "transparent";
            icon-color = "blue";
            label-color = "blue";
            popup-position = "bottom-right";
            middle-click = "wayle notify dismiss-all";
          };
          systray = {
            icon-scale = 1.25;
            item-gap = 0.75;
          };
          volume = {
            icon-bg-color = "transparent";
            icon-color = "red";
          };
        };
        osd = {
          margin = 50.0;
          position = "top-right";
        };
        styling = {
          scale = 0.75;
          palette = {
            bg = "#eff1f5";
            blue = "#1e66f5";
            elevated = "#dce0e8";
            fg = "#4c4f69";
            fg-muted = "#5c5f77";
            green = "#40a02b";
            primary = "#7287fd";
            red = "#d20f39";
            surface = "#e6e9ef";
            yellow = "#df8e1d";
          };
        };
        wallpaper.engine-enabled = false;
      };
    };
  };
}
