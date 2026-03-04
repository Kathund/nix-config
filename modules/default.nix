{
  lib,
  config,
  username,
  ...
}:
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
    ./communication
    ./dev
    ./games
    ./hardware
    ./homelab
    ./hypr
    ./kde
    ./misc
    ./music
    ./styles
    ./terminal
    ./utilities
  ];
}
