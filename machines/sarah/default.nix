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
  ];

  networking = {
    hostName = "sarah";
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  
  users.users.kathund = {
    isNormalUser = true;
    description = "kathund";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    cloudflared
    glances
  ];

}
