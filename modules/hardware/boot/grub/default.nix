{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "grub";
  cfg = config.modules.hardware.boot.${program};
in
{
  options.modules.hardware.boot.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    boot = {
      loader = {
        grub = {
          enable = true;
          useOSProber = true;
          # TODO: Make this machine dependent
          gfxmodeEfi = "3840x2160";
          gfxmodeBios = "3840x2160";
        };
      };
    };

    environment = lib.mkIf config.modules.styles.catppuccin.enable {
      systemPackages = with pkgs; [
        catppuccin-grub
      ];
    };
    boot = {
      loader = {
        grub = {
          theme = lib.mkIf config.modules.styles.catppuccin.enable pkgs.catppuccin-grub;
        };
      };
    };
  };
}
