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
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "sapphire";
        font = "JetBrainsMono Nerd Font";
        fontSize = "16";
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
