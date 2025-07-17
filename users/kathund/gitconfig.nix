{
  inputs,
  lib,
  config,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Jacob";
    userEmail = "admin@kath.lol";
  };
}
