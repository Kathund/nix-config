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
  cfg = config.modules.utilities.launchers.${program};
in
{
  options.modules.utilities.launchers.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    home-manager = {
      users = {
        ${username} = {
          imports = [ inputs.vicinae.homeManagerModules.default ];
          services = lib.mkIf cfg.enable {
            vicinae = {
              enable = true;
              systemd = {
                enable = true;
                autoStart = true;
                environment = {
                  USE_LAYER_SHELL = 1;
                };
              };
              settings = {
                close_on_focus_loss = true;
                pop_to_root_on_close = true;
                launcher_window.opacity = lib.mkForce 0.9;
                font = {
                  normal = {
                    family = "JetBrainsMono Nerd Font Mono";
                  };
                };
                theme = {
                  dark = {
                    name = "catppuccin-frappe";
                    icon_theme = "Catppuccin Mocha Pink";
                  };
                };
                telemetry = {
                  system_info = false;
                };
                providers = {
                  "@sovereign/vicinae-extension-awww-switcher-0" = {
                    enable = true;
                    preferences = {
                      wallpaperPath = config.modules.misc.awww.directory;
                    };
                  };
                  "@leonkohli/vicinae-extension-process-manager-0" = {
                    enabled = true;
                  };
                  browser-extension = {
                    enabled = false;
                  };
                  clipboard = {
                    preferences = {
                      encryption = false;
                      eraseOnStartup = true;
                      ignorePasswords = true;
                      monitoring = true;
                    };
                    entrypoints = {
                      history = {
                        preferences = {
                          defaultAction = "copy";
                        };
                      };
                    };
                  };
                  core = {
                    entrypoints = {
                      sponsor = {
                        enabled = false;
                      };
                    };
                  };
                  developer = {
                    enabled = false;
                  };
                  files = {
                    enabled = true;
                  };
                };
              };
              extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
                awww-switcher
                nix
                protondb-search
                process-manager
              ];
            };
          };
          wayland = lib.mkIf cfg.hyprlandBind {
            windowManager = {
              hyprland = {
                settings = {
                  bind = [
                    "SUPER_SHIFT, S, exec, vicinae toggle"
                    "SUPER_SHIFT, V, exec, vicinae vicinae://launch/clipboard/history"
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
