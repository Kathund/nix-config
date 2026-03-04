{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "sddm";
  cfg = config.modules.hardware.boot.${program};
in
{
  options.modules.hardware.boot.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    fontSize = lib.mkOption {
      type = lib.types.str;
      default = "24";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      displayManager = {
        sddm = {
          enable = true;
          package = lib.mkDefault pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };
        };
      };
    };

    environment = lib.mkIf config.modules.styles.catppuccin.enable {
      systemPackages = [
        (pkgs.catppuccin-sddm.override {
          flavor = config.modules.styles.catppuccin.flavor;
          accent = config.modules.styles.catppuccin.accent;
          font = "JetBrainsMono Nerd Font";
          fontSize = cfg.fontSize;
          loginBackground = false;
        })
      ];
    };

    services = {
      displayManager = {
        sddm = {
          theme = lib.mkIf config.modules.styles.catppuccin.enable "catppuccin-${config.modules.styles.catppuccin.flavor}-${config.modules.styles.catppuccin.accent}";
        };
      };
    };
  };
}
