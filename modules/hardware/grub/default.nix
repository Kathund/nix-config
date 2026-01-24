{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "grub";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        catppuccin-grub
      ];
    };
    boot = {
      loader = {
        timeout = 10;
        grub = {
          enable = true;
          useOSProber = true;
          theme = pkgs.catppuccin-grub;
          # TODO: Make this machine dependent
          gfxmodeEfi = "3840x2160";
          gfxmodeBios = "3840x2160";
        };
      };
    };
  };
}
