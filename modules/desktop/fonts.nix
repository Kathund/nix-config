{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "fonts";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      packages = with pkgs; [
        open-sans
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
        jetbrains-mono
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          emoji = [ "Noto Color Emoji" ];
          monospace = [ "JetBrainsMono Nerd Font" ];
          sansSerif = [ "Open Sans" ];
          serif = [ "Noto Serif" ];
        };
      };
    };
  };
}
