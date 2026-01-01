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
    ./editors
    ./hardware
    ./homelab
    ./hypr
    ./kde
    ./misc
    ./styles
    ./terminal
  ];
}
