{
  lib,
  config,
  username,
  ...
}:
let
  cfg = config.programs;
in
{
  options.programs = {
    configPath = lib.mkOption {
      default = "/home/${username}/nix-config";
      type = lib.types.str;
      description = "Location of the nix config";
    };
  };
  imports = [
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
