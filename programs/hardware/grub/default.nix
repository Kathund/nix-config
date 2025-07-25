{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "grub";
  cfg = config.programs.hardware.${program};
in
{
  options.programs.hardware.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      catppuccin-grub
    ];
    boot = {
      loader = {
        timeout = 10;
        grub = {
          enable = true;
          useOSProber = true;
          theme = pkgs.catppuccin-grub;
          gfxmodeEfi = "3840x2160";
          gfxmodeBios = "3840x2160";
        };
      };
    };
  };
}
