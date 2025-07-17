{
  pkgs,
  inputs,
  ...
}:
let
  machine = "sarah";
in
{
  imports = [
    ./hardware-configuration.nix
    ./homelab
  ];

  networking = {
    hostName = "sarah";
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    cloudflared
    glances
  ];

}
