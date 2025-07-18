{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./homelab
    ./programs
  ];

  networking = {
    hostName = "sarah";
  };

  boot.loader.grub.device = "/dev/sda";
}
