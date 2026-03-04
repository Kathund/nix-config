{
  config,
  lib,
  pkgs,
  username,
  inputs,
  ...
}:
let
  program = "pipeweaver";
  cfg = config.modules.hardware.sound.${program};
in
{
  options.modules.hardware.sound.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf cfg.enable {
    nixpkgs = {
      overlays = [
        (_: prev: {
          pipeweaver = inputs.pipeweaver.legacyPackages.${prev.system}.pipeweaver;
        })
      ];
    };
    environment = {
      systemPackages = with pkgs; [
        inputs.pipeweaver.legacyPackages.${pkgs.stdenv.hostPlatform.system}.pipeweaver
      ];
    };
    home-manager = {
      users = {
        ${username} = {
          wayland = lib.mkIf cfg.loadOnStartup {
            windowManager = {
              hyprland = {
                settings = {
                  exec-once = [
                    "pipeweaver-daemon --background"
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
