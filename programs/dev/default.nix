{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.programs.dev = {
    enable = lib.mkEnableOption "Settings and services for the dev programs";
  };

  config = lib.mkIf config.programs.dev.enable {
  };

  imports = [
    ./nodejs
  ];
}
