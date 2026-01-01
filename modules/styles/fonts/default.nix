{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "fonts";
  cfg = config.modules.styles.${program};
in
{
  options.modules.styles.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      monocraft
      open-sans
      merriweather
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
      jetbrains-mono
    ];
  };
}
