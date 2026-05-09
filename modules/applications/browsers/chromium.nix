{
  config,
  lib,
  username,
  ...
}:
let
  program = "chromium";
  cfg = config.modules.applications.browsers.${program};
in
{
  options.modules.applications.browsers.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    setDefault = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = {
      programs.${program}.enable = true;
      wayland.windowManager.hyprland.settings.bind = lib.mkIf cfg.hyprlandBind [
        "SUPER, S, exec, ${program}"
      ];
      xdg.mimeApps = lib.mkIf cfg.setDefault {
        enable = true;
        defaultApplications = {
          "text/html" = "chromium-browser.desktop";
          "x-scheme-handler/http" = "chromium-browser.desktop";
          "x-scheme-handler/https" = "chromium-browser.desktop";
          "x-scheme-handler/about" = "chromium-browser.desktop";
          "x-scheme-handler/unknown" = "chromium-browser.desktop";
        };
      };
    };
  };
}
