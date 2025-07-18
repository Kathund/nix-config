{ lib, config, ... }:
let
  cfg = config.programs;
in
{
  options.programs = {
    enable = lib.mkEnableOption "The programs configs";
  };
  imports = [
    ./dev
  ];
}
