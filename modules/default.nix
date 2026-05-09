{ lib, username, ... }:
{
  options.modules = {
    configPath = lib.mkOption {
      default = "/home/${username}/nix-config";
      type = lib.types.str;
      description = "Location of the nix config";
    };
  };
  imports = [
    ./applications
    ./desktop
    ./dev
    ./hardware
    ./homelab
    ./terminal
  ];
}
