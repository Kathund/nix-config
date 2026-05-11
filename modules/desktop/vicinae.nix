{
  config,
  lib,
  username,
  inputs,
  pkgs,
  ...
}:
let
  program = "vicinae";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    home-manager.users.${username} = {
      imports = [ inputs.vicinae.homeManagerModules.default ];
      services = lib.mkIf cfg.enable {
        vicinae = {
          enable = true;
          systemd = {
            enable = true;
            autoStart = true;
            environment.USE_LAYER_SHELL = 1;
          };
          settings = {
            close_on_focus_loss = false;
            pop_to_root_on_close = true;
            launcher_window.opacity = lib.mkForce 0.9;
            font.normal.family = "JetBrainsMono Nerd Font Mono";
            theme.dark = {
              name = "catppuccin-frappe";
              icon_theme = "Catppuccin Mocha Pink";
            };
            telemetry.system_info = false;
            providers = {
              "@sovereign/vicinae-extension-awww-switcher-0" = {
                enable = true;
                preferences = {
                  wallpaperPath = config.modules.desktop.awww.directory;
                };
              };
              "@leonkohli/vicinae-extension-process-manager-0".enabled = true;
              "@knoopx/vicinae-extension-nix-0".enabled = true;
              "@Costeer/vicinae-extension-color-converter-0".enabled = true;
              "@alan7a/vicinae-extension-case-converter-0".enabled = true;
              browser-extension.enabled = false;
              clipboard = {
                preferences = {
                  encryption = false;
                  eraseOnStartup = true;
                  ignorePasswords = true;
                  monitoring = true;
                };
                entrypoints.history.preferences.defaultAction = "copy";
              };
              core.entrypoints.sponsor.enabled = false;
              developer.enabled = true;
              files.enabled = true;
            };
          };
          extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
            awww-switcher
            case-converter
            color-converter
            nix
            protondb-search
            process-manager
          ];
        };
      };
      wayland.windowManager.hyprland.settings.bind = lib.mkIf cfg.hyprlandBind [
        "SUPER_SHIFT, S, exec, vicinae toggle"
        "SUPER_SHIFT, V, exec, vicinae vicinae://launch/clipboard/history"
      ];
    };
  };
}
