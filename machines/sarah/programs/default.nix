{
  config,
  inputs,
  pkgs,
  ...
}:
{
  config.programs = {
    dev = {
      nodejs = {
        enable = true;
      };
    };
  };
}
