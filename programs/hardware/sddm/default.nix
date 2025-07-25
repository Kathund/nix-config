{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "sddm";
  cfg = config.programs.hardware.${program};
in
{
  options.programs.hardware.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    wallpaper = lib.mkOption {
      type = lib.types.path;
      default = ../../../assets/sddm-wall.png;
      description = "Wallpaper to use for the SDDM Astronaut theme";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        font = "JetBrainsMono Nerd Font";
        fontSize = "24";
        background = cfg.wallpaper;
        loginBackground = false;
      })
    ];
    services = {
      displayManager = {
        sddm = {
          enable = true;
          theme = "catppuccin-mocha";
          package = pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };
        };
      };
    };
  };
}
