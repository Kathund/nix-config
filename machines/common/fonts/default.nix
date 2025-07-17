{
  config,
  inputs,
  pkgs,
  lib,
  ...
}:
{
  fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      monocraft
    ] ++ (lib.filter (e: e ? type && e.type == "derivation" ) (lib.attrValues nerd-fonts));
}
