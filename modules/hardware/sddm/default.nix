{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "sddm";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    fontSize = lib.mkOption {
      type = lib.types.str;
      default = "24";
    };
  };

  config = lib.mkIf cfg.enable {
    environment = {
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
          enable = true;
          theme = "catppuccin-${config.modules.styles.catppuccin.flavor}-${config.modules.styles.catppuccin.accent}";
          package = lib.mkDefault pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };
        };
      };
    };
  };
}
