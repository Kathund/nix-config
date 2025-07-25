{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "fonts";
  cfg = config.programs.styles.${program};
in
{
  options.programs.styles.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      monocraft
      open-sans
      merriweather
      noto-fonts-emoji
      nerd-fonts.jetbrains-mono
      jetbrains-mono
    ];
  };
}
