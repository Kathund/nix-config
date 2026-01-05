{
  lib,
  config,
  username,
  ...
}:
let
  cfg = config.modules;
in
{
  options.modules = {
    configPath = lib.mkOption {
      default = "/home/${username}/nix-config";
      type = lib.types.str;
      description = "Location of the nix config";
    };
  };
  imports = [
    ./browsers
    ./dev
    ./hardware
    ./homelab
    ./hypr
    ./kde
    ./misc
    ./styles
    ./terminal
  ];
}
