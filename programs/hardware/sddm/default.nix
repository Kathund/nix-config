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
    fontSize = lib.mkOption {
      type = lib.types.str;
      default = "24";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "sapphire";
        font = "JetBrainsMono Nerd Font";
        fontSize = cfg.fontSize;
        loginBackground = false;
      })
    ];
    services = {
      displayManager = {
        sddm = {
          enable = true;
          theme = "catppuccin-mocha-sapphire";
          package = pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };
        };
      };
    };
  };
}
