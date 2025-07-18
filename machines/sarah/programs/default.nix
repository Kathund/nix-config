{
  config,
  inputs,
  pkgs,
  ...
}:
{
  config.programs = {
    enable = true;
    dev = {
      enable = true;
      nodejs = {
        enable = true;
      };
    };
  };
}
