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
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    device = lib.mkOption { type = lib.types.str; };
  };

  config = lib.mkIf cfg.enable {
    boot.loader.${program} = {
      enable = true;
      useOSProber = true;
      # TODO: Make this machine dependent
      gfxmodeEfi = "3840x2160";
      gfxmodeBios = "3840x2160";
      theme = lib.mkIf config.modules.desktop.catppuccin.enable pkgs.catppuccin-grub;
      inherit (cfg) device;
    };
    environment.systemPackages = lib.mkIf config.modules.desktop.catppuccin.enable [
      pkgs.catppuccin-grub
    ];
  };
}
