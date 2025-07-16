{
  config,
  inputs,
  pkgs,
  ...
}:
let
  homelab = config.homelab;
in
{
  homelab = {
    enable = true;
    baseDomain = "kath.lol";
    timeZone = "Australia/Perth";

    services = {
      enable = true;
      microbin = {
        enable = true;
      };
    };
  };
}
