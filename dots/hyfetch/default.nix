{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
{
  programs = {
    fastfetch = {
      enable = true;
    };
    hyfetch = {
      enable = true;
      settings = {
        preset = "rainbow";
        mode = "rgb";
        light_dark = "dark";
        lightness = 0.82;
        color_align = {
          mode = "horizontal";
        };
      };
    };
  };
}
