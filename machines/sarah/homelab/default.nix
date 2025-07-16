{
  config,
  inputs,
  pkgs,
  ...
}:
{
  config.homelab = {
    enable = true;
    baseDomain = "kath.lol";
    timeZone = "Australia/Perth";

    services = {
      enable = true;
    };
  };
}
